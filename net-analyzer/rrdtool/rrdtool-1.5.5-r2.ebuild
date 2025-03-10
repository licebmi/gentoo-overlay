# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_OPTIONAL=true
DISTUTILS_SINGLE_IMPL=true
GENTOO_DEPEND_ON_PERL=no
PYTHON_COMPAT=( python3_{8..9} )

inherit autotools eutils perl-module distutils-r1 flag-o-matic multilib

DESCRIPTION="A system to store and display time-series data"
HOMEPAGE="http://oss.oetiker.ch/rrdtool/"
SRC_URI="http://oss.oetiker.ch/rrdtool/pub/${P/_/-}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dbi doc graph lua perl python rados rrdcgi static-libs tcl tcpd"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

CDEPEND="
	dev-libs/glib:2[static-libs(+)?]
	dev-libs/libxml2:2[static-libs(+)?]
	dbi? ( dev-db/libdbi[static-libs(+)?] )
	graph? (
		media-libs/libpng:0=[static-libs(+)?]
		x11-libs/cairo[svg,static-libs(+)?]
		x11-libs/pango
	)
	lua? ( dev-lang/lua:*[deprecated] )
	perl? ( dev-lang/perl:= )
	python? ( ${PYTHON_DEPS} )
	rados? ( sys-cluster/ceph )
	tcl? ( dev-lang/tcl:0= )
	tcpd? ( sys-apps/tcp-wrappers )
"

DEPEND="
	${CDEPEND}
	sys-apps/groff
	virtual/pkgconfig
	virtual/awk
"

RDEPEND="
	${CDEPEND}
"

S=${WORKDIR}/${P/_/-}

python_compile() {
	cd bindings/python || die
	distutils-r1_python_compile
}

python_install() {
	cd bindings/python || die
	distutils-r1_python_install
}

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	default

	# At the next version bump, please see if you actually still need this
	# before adding versions
	cp "${FILESDIR}"/${P}-rpn1.output tests/rpn1.output || die
	cp "${FILESDIR}"/${P}-rrdrados.pod doc/rrdrados.pod || die

	eapply \
		"${FILESDIR}"/${PN}-1.4.7-configure.ac.patch \
		"${FILESDIR}"/${PN}-1.4.9-disable-rrd_graph-cgi.patch \
		"${FILESDIR}"/${PN}-1.4.9-disable-rrd_graph-perl.patch \
		"${FILESDIR}"/${PN}-1.5.0_rc1-disable-rrd_graph-lua.patch \
		"${FILESDIR}"/${PN}-1.5.0_rc1-disable-rrd_graph-python.patch

	# bug 456810
	# no time to sleep
	sed -i \
		-e 's|$LUA_CFLAGS|IGNORE_THIS_BAD_TEST|g' \
		-e 's|^sleep 1$||g' \
		-e '/^dnl.*png/s|^dnl||g' \
		configure.ac || die

	# Python bindings are built/installed manually
	sed -i \
		-e '/^all-local:/s| @COMP_PYTHON@||' \
		bindings/Makefile.am || die

	if ! use graph; then
		sed -i \
			-e '2s:rpn1::; 2s:rpn2::; 6s:create-with-source-4::;' \
			-e '7s:xport1::; 7s:dcounter1::; 7s:vformatter1::' \
			tests/Makefile.am || die
	fi

	echo ${PV/_rc*/} >> VERSION || die

	export rd_cv_gcc_flag__Werror=no

	eautoreconf
}

src_configure() {
	filter-flags -ffast-math

	export RRDDOCDIR=${EPREFIX}/usr/share/doc/${PF}

	# to solve bug #260380
	[[ ${CHOST} == *-solaris* ]] && append-flags -D__EXTENSIONS__

	# Stub configure.ac
	local myconf=()
	if ! use tcpd; then
		myconf+=( "--disable-libwrap" )
	fi
	if ! use dbi; then
		myconf+=( "--disable-libdbi" )
	fi
	if ! use rados; then
		myconf+=( "--disable-librados" )
	fi

	econf \
		$(use_enable graph rrd_graph) \
		$(use_enable lua lua-site-install) \
		$(use_enable lua) \
		$(use_enable perl perl-site-install) \
		$(use_enable perl) \
		$(use_enable python) \
		$(use_enable rrdcgi) \
		$(use_enable static-libs static) \
		$(use_enable tcl) \
		$(use_with tcl tcllib "${EPREFIX}"/usr/$(get_libdir)) \
		--with-perl-options=INSTALLDIRS=vendor \
		--disable-ruby-site-install \
		--disable-ruby \
		${myconf[@]}
}

src_compile() {
	default

	use python && distutils-r1_src_compile
}

src_test() {
	export LC_ALL=C
	default
}

src_install() {
	default

	if ! use doc; then
		rm -r "${ED}"/usr/share/doc/${PF}/{html,txt} || die "couldn't remove doc"
	fi

	if use !rrdcgi; then
		# uses rrdcgi, causes invalid shebang error in Prefix, useless
		# without rrdcgi installed
		rm -f "${ED}"/usr/share/${PN}/examples/cgi-demo.cgi || die "couldn't remove cgi-demo.cgi"
	fi

	if use perl; then
		perl_delete_localpod
		perl_delete_packlist
	fi

	dodoc CHANGES CONTRIBUTORS NEWS THREADS TODO

	find "${ED}"/usr -name '*.la' -exec rm -f {} + || die "couldn't remove .la files"

	keepdir /var/lib/rrdcached/journal/
	keepdir /var/lib/rrdcached/db/

	newconfd "${FILESDIR}"/rrdcached.confd rrdcached
	newinitd "${FILESDIR}"/rrdcached.init rrdcached

	use python && distutils-r1_src_install
}

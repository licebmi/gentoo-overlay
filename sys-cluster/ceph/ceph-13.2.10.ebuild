# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# hard depend on python3_8
# python3_9 compat has been mostly done, down to one final error
# TODO: complete the above
PYTHON_COMPAT=( python3_8 )
DISTUTILS_OPTIONAL=1


inherit check-reqs cmake-utils distutils-r1 flag-o-matic multiprocessing \
	python-r1 udev readme.gentoo-r1 systemd bash-completion-r1

DESCRIPTION="Ceph distributed filesystem"
HOMEPAGE="https://ceph.com/"
SRC_URI="https://download.ceph.com/tarballs/${P}.tar.gz"

LICENSE="LGPL-2.1 CC-BY-SA-3.0 GPL-2 BSD Boost-1.0 MIT"
KEYWORDS="~amd64"

SLOT="0"

CPU_FLAGS_X86=(sse{,2,3,4_1,4_2} ssse3)

IUSE="babeltrace cephfs dpdk fuse jemalloc ldap lttng +mgr"
IUSE+=" numa +radosgw +ssl +system-boost systemd +tcmalloc"
IUSE+=" test xfs zfs"
IUSE+=" $(printf "cpu_flags_x86_%s\n" ${CPU_FLAGS_X86[@]})"

# unbundling code commented out pending bugs 584056 and 584058
#>=dev-libs/jerasure-2.0.0-r1
#>=dev-libs/gf-complete-2.0.0
COMMON_DEPEND="
	virtual/libudev:=
	app-arch/bzip2:=
	app-arch/lz4:=
	app-arch/snappy:=
	app-arch/zstd:=
	app-misc/jq:=
	dev-libs/crypto++:=
	dev-libs/leveldb:=[snappy,tcmalloc?]
	dev-libs/libaio:=
	dev-libs/libxml2:=
	dev-libs/nss:=
	sys-auth/oath-toolkit:=
	sys-apps/keyutils:=
	sys-apps/util-linux:=
	sys-libs/zlib:=
	babeltrace? ( dev-util/babeltrace )
	ldap? ( net-nds/openldap:= )
	lttng? ( dev-util/lttng-ust:= )
	fuse? ( sys-fs/fuse:0= )
	numa? ( sys-process/numactl:= )
	ssl? ( dev-libs/openssl:= )
	xfs? ( sys-fs/xfsprogs:= )
	zfs? ( sys-fs/zfs:= )
	radosgw? (
		dev-libs/expat:=
		dev-libs/openssl:=
		net-misc/curl:=[curl_ssl_openssl]
	)
	system-boost? (
		>=dev-libs/boost-1.67:=[threads,context,python,${PYTHON_USEDEP}]
	)
	jemalloc? ( dev-libs/jemalloc:= )
	!jemalloc? ( >=dev-util/google-perftools-2.4:= )
	${PYTHON_DEPS}
"

DEPEND="
	${COMMON_DEPEND}
	amd64? ( dev-lang/yasm )
	x86? ( dev-lang/yasm )
	app-arch/cpio
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/sphinx
	dev-util/cunit
	dev-util/gperf
	dev-util/valgrind
	sys-apps/which
	sys-devel/bc
	virtual/pkgconfig
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/virtualenv[${PYTHON_USEDEP}]
		sys-apps/grep[pcre]
		sys-fs/btrfs-progs
	)
"

RDEPEND="
	${COMMON_DEPEND}
	acct-group/ceph
	acct-user/ceph
	net-misc/socat
	sys-apps/gptfdisk
	sys-block/parted
	sys-fs/cryptsetup
	sys-fs/lvm2[-device-mapper-only(-)]
	!<sys-apps/openrc-0.26.3
	dev-python/bcrypt[${PYTHON_USEDEP}]
	dev-python/cherrypy[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/pecan[${PYTHON_USEDEP}]
	dev-python/prettytable[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
"

REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
	|| ( $(python_gen_useflags 'python3*') )
	?? ( jemalloc tcmalloc )
"

# the tests need root access
RESTRICT="test? ( userpriv )"

# distribution tarball does not include everything needed for tests
RESTRICT+=" test"

# false positives unless all USE flags are on
CMAKE_WARN_UNUSED_CLI="no"

# ninja does not work at all
CMAKE_MAKEFILE_GENERATOR="emake"

UNBUNDLE_LIBS=(
	src/erasure-code/jerasure/jerasure
	src/erasure-code/jerasure/gf-complete
)

PATCHES=(
	"${FILESDIR}/ceph-12.2.0-cflags.patch"
	"${FILESDIR}/ceph-12.2.0-use-provided-cpu-flag-values.patch"
	"${FILESDIR}/ceph-12.2.4-boost-build-none-options.patch"
	"${FILESDIR}/ceph-12.2.4-rocksdb-cflags.patch"
	"${FILESDIR}/ceph-12.2.12-ncurses-tinfo.patch"
	"${FILESDIR}/ceph-13.2.0-cflags.patch"
	"${FILESDIR}/ceph-13.2.0-mgr-python-version.patch"
	"${FILESDIR}/ceph-13.2.6-no-virtualenvs.patch"
	"${FILESDIR}/ceph-13.2.2-dont-install-sysvinit-script.patch"
	"${FILESDIR}/ceph-13.2.5-no-automagic-deps.patch"
	"${FILESDIR}/ceph-13.2.6-dpdk-alignment.patch"
	"${FILESDIR}/ceph-14.2.0-cython-0.29.patch"
	"${FILESDIR}/ceph-13.2.10-bit-str.patch"
	"${FILESDIR}/ceph-13.2.10-signal-handler.patch"
	"${FILESDIR}/adjust-boost-py37-compat.patch"
	"${FILESDIR}/adjust-collections-abc-compat.patch"
	"${FILESDIR}/adjust-mgr-python3-syntax-issues.patch"
	"${FILESDIR}/python3-aware.patch"
	"${FILESDIR}/python3-libs.patch"
	"${FILESDIR}/py37-compat.patch"
	"${FILESDIR}/py39-compat.patch"
)

check-reqs_export_vars() {
	if use amd64; then
		CHECKREQS_DISK_BUILD="12G"
		CHECKREQS_DISK_USR="460M"
	else
		CHECKREQS_DISK_BUILD="1400M"
		CHECKREQS_DISK_USR="450M"
	fi

	export CHECKREQS_DISK_BUILD CHECKREQS_DISK_USR
}

pkg_pretend() {
	check-reqs_export_vars
	check-reqs_pkg_pretend
}

pkg_setup() {
	python_setup 'python3*'
	check-reqs_export_vars
	check-reqs_pkg_setup
}

src_prepare() {
	cmake-utils_src_prepare

	if use system-boost; then
		eapply "${FILESDIR}/ceph-13.2.0-boost-sonames.patch"
	fi

	sed -i -r "s:DESTINATION .+\\):DESTINATION $(get_bashcompdir)\\):" \
		src/bash_completion/CMakeLists.txt || die

	# remove tests that need root access
	rm src/test/cli/ceph-authtool/cap*.t || die

	#rm -rf "${UNBUNDLE_LIBS[@]}"
}

ceph_src_configure() {
	local flag
	local mycmakeargs=(
		-DWITH_BABELTRACE=$(usex babeltrace)
		-DWITH_CEPHFS=$(usex cephfs)
		-DWITH_DPDK=$(usex dpdk)
		-DWITH_FUSE=$(usex fuse)
		-DWITH_LTTNG=$(usex lttng)
		-DWITH_MGR=$(usex mgr)
		-DWITH_MGR_DASHBOARD_FRONTEND=NO
		-DMGR_PYTHON_VERSION=3
		-DWITH_NUMA=$(usex numa)
		-DWITH_OPENLDAP=$(usex ldap)
		-DWITH_RADOSGW=$(usex radosgw)
		-DWITH_SSL=$(usex ssl)
		-DWITH_SYSTEMD=$(usex systemd)
		-DWITH_TESTS=$(usex test)
		-DWITH_XFS=$(usex xfs)
		-DWITH_ZFS=$(usex zfs)
		-DENABLE_SHARED=ON
		-DALLOCATOR=$(usex tcmalloc 'tcmalloc' "$(usex jemalloc 'jemalloc' 'libc')")
		-DWITH_SYSTEM_BOOST=$(usex system-boost)
		-DBOOST_J=$(makeopts_jobs)
		-DWITH_RDMA=no
		-DWITH_TBB=no
		-DSYSTEMD_UNITDIR=$(systemd_get_systemunitdir)
		-DEPYTHON_VERSION="${EPYTHON#python}"
		-DCMAKE_INSTALL_DOCDIR="${EPREFIX}/usr/share/doc/${P}"
		-DCMAKE_INSTALL_SYSCONFDIR="${EPREFIX}/etc"
		-Wno-dev
	)
	if use amd64 || use x86; then
		for flag in ${CPU_FLAGS_X86[@]}; do
			mycmakeargs+=("$(usex cpu_flags_x86_${flag} "-DHAVE_INTEL_${flag^^}=1")")
		done
	fi

	rm -f "${BUILD_DIR:-${S}}/CMakeCache.txt"
	cmake-utils_src_configure

	# bug #630232
	sed -i "s:\"${T//:\\:}/${EPYTHON}/bin/python\":\"${PYTHON}\":" \
		"${BUILD_DIR:--${S}}"/include/acconfig.h \
		|| die "sed failed"
}

src_configure() {
	ceph_src_configure
}

python_compile() {
	local CMAKE_USE_DIR="${S}"
	ceph_src_configure

	rm -rf "${BUILD_DIR}/lib/cython_modules" || die

	pushd "${BUILD_DIR}/src/pybind" >/dev/null || die
	emake VERBOSE=1 clean
	emake VERBOSE=1 all

	# python modules are only compiled with "make install" so we need to do this to
	# prevent doing a bunch of compilation in src_install
	DESTDIR="${T}" emake VERBOSE=1 install
	popd >/dev/null || die
}

src_compile() {
	cmake-utils_src_make VERBOSE=1 all

	# we have to do this here to prevent from building everything multiple times
	BUILD_DIR="${CMAKE_BUILD_DIR}" python_copy_sources
	python_foreach_impl python_compile
}

src_test() {
	make check || die "make check failed"
}

python_install() {
	local CMAKE_USE_DIR="${S}"
	pushd "${BUILD_DIR}/src/pybind" >/dev/null || die
	DESTDIR="${ED}" emake install
	popd >/dev/null || die
}

src_install() {
	cmake-utils_src_install
	python_foreach_impl python_install

	find "${D}" -name '*.la' -delete || die

	exeinto /usr/$(get_libdir)/ceph
	newexe "${BUILD_DIR}/bin/init-ceph" ceph_init.sh

	insinto /etc/logrotate.d/
	newins "${FILESDIR}"/ceph.logrotate-r2 ${PN}

	keepdir /var/lib/${PN}{,/tmp} /var/log/${PN}/stat

	fowners -R ceph:ceph /var/lib/ceph /var/log/ceph

	newinitd "${FILESDIR}/rbdmap.initd" rbdmap
	newinitd "${FILESDIR}/${PN}.initd-r12" ${PN}
	newconfd "${FILESDIR}/${PN}.confd-r5" ${PN}

	insinto /etc/sysctl.d
	newins "${FILESDIR}"/sysctld 90-${PN}.conf

	use tcmalloc && newenvd "${FILESDIR}"/envd-tcmalloc 99${PN}-tcmalloc

	# units aren't installed by the build system unless systemd is enabled
	# so no point installing these with the USE flag disabled
	if use systemd; then
		systemd_install_serviced "${FILESDIR}/ceph-mds_at.service.conf" \
			"ceph-mds@.service"

		systemd_install_serviced "${FILESDIR}/ceph-osd_at.service.conf" \
			"ceph-osd@.service"
	fi

	udev_dorules udev/*.rules

	readme.gentoo_create_doc

	python_setup 'python3*'

	# bug #630232
	sed -i -r "s:${T//:/\\:}/${EPYTHON}:/usr:" "${ED}"/usr/bin/ceph \
		|| die "sed failed"

	python_fix_shebang "${ED}"/usr/{,s}bin/

	# python_fix_shebang apparently is not idempotent
	sed -i -r  's:(/usr/lib/python-exec/python[0-9]\.[0-9]/python)[0-9]\.[0-9]:\1:' \
		"${ED}"/usr/{sbin/ceph-disk,bin/ceph-detect-init} || die "sed failed"

	local -a rados_classes=( "${D}/usr/$(get_libdir)/rados-classes"/* )
	dostrip -x "${rados_classes[@]#${D}}"
}

pkg_postinst() {
	readme.gentoo_print_elog
}

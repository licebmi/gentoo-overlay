# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=bdepend
PYTHON_COMPAT=( pypy3 python3_{8..10} )
PYTHON_REQ_USE='bzip2(+),threads(+)'
TMPFILES_OPTIONAL=1

inherit distutils-r1 linux-info tmpfiles prefix

DESCRIPTION="Portage is the package management and distribution system for Gentoo"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Portage"

LICENSE="GPL-2"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86"
SLOT="0"
IUSE="apidoc build doc gentoo-dev +ipc +native-extensions +rsync-verify selinux test xattr"
RESTRICT="!test? ( test )"

BDEPEND="
	app-arch/xz-utils
	test? ( dev-vcs/git )"
DEPEND="!build? ( $(python_gen_impl_dep 'ssl(+)') )
	>=app-arch/tar-1.27
	dev-lang/python-exec:2
	>=sys-apps/sed-4.0.5 sys-devel/patch
	doc? ( app-text/xmlto ~app-text/docbook-xml-dtd-4.4 )
	apidoc? (
		dev-python/sphinx
		dev-python/sphinx-epytext
	)"
# Require sandbox-2.2 for bug #288863.
# For whirlpool hash, require python[ssl] (bug #425046).
# For compgen, require bash[readline] (bug #445576).
# app-portage/gemato goes without PYTHON_USEDEP since we're calling
# the executable.
RDEPEND="
	acct-user/portage
	app-arch/zstd
	>=app-arch/tar-1.27
	dev-lang/python-exec:2
	>=sys-apps/findutils-4.4
	!build? (
		>=sys-apps/sed-4.0.5
		app-shells/bash:0[readline]
		>=app-admin/eselect-1.2
		rsync-verify? (
			>=app-portage/gemato-14.5[${PYTHON_USEDEP}]
			>=app-crypt/openpgp-keys-gentoo-release-20180706
			>=app-crypt/gnupg-2.2.4-r2[ssl(-)]
		)
	)
	elibc_glibc? ( >=sys-apps/sandbox-2.2 )
	elibc_musl? ( >=sys-apps/sandbox-2.2 )
	elibc_uclibc? ( >=sys-apps/sandbox-2.2 )
	kernel_linux? ( sys-apps/util-linux )
	>=app-misc/pax-utils-0.1.17
	selinux? ( >=sys-libs/libselinux-2.0.94[python,${PYTHON_USEDEP}] )
	xattr? ( kernel_linux? (
		>=sys-apps/install-xattr-0.3
	) )
	!<app-admin/logrotate-3.8.0
	!<app-portage/gentoolkit-0.4.6
	!<app-portage/repoman-2.3.10
	!~app-portage/repoman-3.0.0"
PDEPEND="
	!build? (
		>=net-misc/rsync-2.6.4
		userland_GNU? ( >=sys-apps/coreutils-6.4 )
	)"
# coreutils-6.4 rdep is for date format in emerge-webrsync #164532
# NOTE: FEATURES=installsources requires debugedit and rsync

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
	https://github.com/gentoo/portage/commit/a4d882964ee1931462f911d0c46a80e27e59fa48.patch -> portage-3.0.20-bug-777492-a4d8829.patch
	https://github.com/gentoo/portage/commit/209be9a8bee13384dd04a4762436b4c2a5e35bc6.patch -> portage-3.0.20-bug-777492-209be9a.patch
	https://github.com/gentoo/portage/compare/8e47286b7082aac21fe25402a1f9d03db968cd30...693f6bf5a54e2424e2ad49e1838b61f76bf78e40.patch -> portage-3.0.20-bug-796584-693f6bf.patch
	https://github.com/gentoo/portage/commit/2ce11f06e48290efb2d4b6743c8edf01c176b0fc.patch -> portage-3.0.20-bug-796812-2ce11f0.patch
	https://github.com/gentoo/portage/compare/2ce11f06e48290efb2d4b6743c8edf01c176b0fc...c3e4919fd004ce0f5c91c67ea377bbda83558ca9.patch -> portage-3.0.20-bug-796959-c8a52e1-c3e4919.patch"

PATCHES=(
	"${FILESDIR}/${PN}-3.0.13-silence-deprecated-profile-check.patch"
)

pkg_pretend() {
	local CONFIG_CHECK="~IPC_NS ~PID_NS ~NET_NS ~UTS_NS"

	check_extra_config
}

python_prepare_all() {
	distutils-r1_python_prepare_all

	# Revert due to regressions:
	# https://bugs.gentoo.org/777492
	# https://github.com/gentoo/portage/pull/728
	eapply -R "${DISTDIR}/portage-3.0.20-bug-777492-209be9a.patch"
	eapply -R "${DISTDIR}/portage-3.0.20-bug-777492-a4d8829.patch"

	# Apply regression fix for https://bugs.gentoo.org/796584.
	eapply "${DISTDIR}/portage-3.0.20-bug-796584-693f6bf.patch"

	# Apply EAPI 8 fix for https://bugs.gentoo.org/796812.
	eapply "${DISTDIR}/portage-3.0.20-bug-796812-2ce11f0.patch"

	# Apply EAPI 8 fix for https://bugs.gentoo.org/796959
	eapply "${DISTDIR}/portage-3.0.20-bug-796959-c8a52e1-c3e4919.patch"

	sed -e "s:^VERSION = \"HEAD\"$:VERSION = \"${PV}\":" -i lib/portage/__init__.py || die

	if use gentoo-dev; then
		einfo "Disabling --dynamic-deps by default for gentoo-dev..."
		sed -e 's:\("--dynamic-deps", \)\("y"\):\1"n":' \
			-i lib/_emerge/create_depgraph_params.py || \
			die "failed to patch create_depgraph_params.py"

		einfo "Enabling additional FEATURES for gentoo-dev..."
		echo 'FEATURES="${FEATURES} strict-keepdir"' \
			>> cnf/make.globals || die
	fi

	if use native-extensions; then
		printf "[build_ext]\nportage-ext-modules=true\n" >> \
			setup.cfg || die
	fi

	if ! use ipc ; then
		einfo "Disabling ipc..."
		sed -e "s:_enable_ipc_daemon = True:_enable_ipc_daemon = False:" \
			-i lib/_emerge/AbstractEbuildProcess.py || \
			die "failed to patch AbstractEbuildProcess.py"
	fi

	if use xattr && use kernel_linux ; then
		einfo "Adding FEATURES=xattr to make.globals ..."
		echo -e '\nFEATURES="${FEATURES} xattr"' >> cnf/make.globals \
			|| die "failed to append to make.globals"
	fi

	if use build || ! use rsync-verify; then
		sed -e '/^sync-rsync-verify-metamanifest/s|yes|no|' \
			-e '/^sync-webrsync-verify-signature/s|yes|no|' \
			-i cnf/repos.conf || die "sed failed"
	fi

	if [[ -n ${EPREFIX} ]] ; then
		einfo "Setting portage.const.EPREFIX ..."
		hprefixify -e "s|^(EPREFIX[[:space:]]*=[[:space:]]*\").*|\1${EPREFIX}\"|" \
			-w "/_BINARY/" lib/portage/const.py

		einfo "Prefixing shebangs ..."
		> "${T}/shebangs" || die
		while read -r -d $'\0' ; do
			local shebang=$(head -n1 "$REPLY")
			if [[ ${shebang} == "#!"* && ! ${shebang} == "#!${EPREFIX}/"* ]] ; then
				echo "${REPLY}" >> "${T}/shebangs" || die
			fi
		done < <(find . -type f -executable ! -name etc-update -print0)

		if [[ -s ${T}/shebangs ]]; then
			xargs sed -i -e "1s:^#!:#!${EPREFIX}:" < "${T}/shebangs" || die "sed failed"
		fi

		einfo "Adjusting make.globals, repos.conf and etc-update ..."
		hprefixify cnf/{make.globals,repos.conf} bin/etc-update

		if use prefix-guest ; then
			sed -e "s|^\(main-repo = \).*|\\1gentoo_prefix|" \
				-e "s|^\\[gentoo\\]|[gentoo_prefix]|" \
				-e "s|^\(sync-uri = \).*|\\1rsync://rsync.prefix.bitzolder.nl/gentoo-portage-prefix|" \
				-i cnf/repos.conf || die "sed failed"
		fi

		einfo "Adding FEATURES=force-prefix to make.globals ..."
		echo -e '\nFEATURES="${FEATURES} force-prefix"' >> cnf/make.globals \
			|| die "failed to append to make.globals"
	fi

	cd "${S}/cnf" || die
	if [ -f "make.conf.example.${ARCH}".diff ]; then
		patch make.conf.example "make.conf.example.${ARCH}".diff || \
			die "Failed to patch make.conf.example"
	else
		eerror ""
		eerror "Portage does not have an arch-specific configuration for this arch."
		eerror "Please notify the arch maintainer about this issue. Using generic."
		eerror ""
	fi
}

python_compile_all() {
	local targets=()
	use doc && targets+=( docbook )
	use apidoc && targets+=( apidoc )

	if [[ ${targets[@]} ]]; then
		esetup.py "${targets[@]}"
	fi
}

python_test() {
	esetup.py test
}

python_install() {
	# Install sbin scripts to bindir for python-exec linking
	# they will be relocated in pkg_preinst()
	distutils-r1_python_install \
		--system-prefix="${EPREFIX}/usr" \
		--bindir="$(python_get_scriptdir)" \
		--docdir="${EPREFIX}/usr/share/doc/${PF}" \
		--htmldir="${EPREFIX}/usr/share/doc/${PF}/html" \
		--portage-bindir="${EPREFIX}/usr/lib/portage/${EPYTHON}" \
		--sbindir="$(python_get_scriptdir)" \
		--sysconfdir="${EPREFIX}/etc" \
		"${@}"
}

python_install_all() {
	distutils-r1_python_install_all

	local targets=()
	use doc && targets+=(
		install_docbook
		--htmldir="${EPREFIX}/usr/share/doc/${PF}/html"
	)
	use apidoc && targets+=(
		install_apidoc
		--htmldir="${EPREFIX}/usr/share/doc/${PF}/html"
	)

	# install docs
	if [[ ${targets[@]} ]]; then
		esetup.py "${targets[@]}"
	fi

	dotmpfiles "${FILESDIR}"/portage-ccache.conf

	# Due to distutils/python-exec limitations
	# these must be installed to /usr/bin.
	local sbin_relocations='archive-conf dispatch-conf emaint env-update etc-update fixpackages regenworld'
	einfo "Moving admin scripts to the correct directory"
	dodir /usr/sbin
	for target in ${sbin_relocations}; do
		einfo "Moving /usr/bin/${target} to /usr/sbin/${target}"
		mv "${ED}/usr/bin/${target}" "${ED}/usr/sbin/${target}" || die "sbin scripts move failed!"
	done
}

pkg_preinst() {
	python_setup
	local sitedir=$(python_get_sitedir)
	[[ -d ${D}${sitedir} ]] || die "${D}${sitedir}: No such directory"
	env -u DISTDIR \
		-u PORTAGE_OVERRIDE_EPREFIX \
		-u PORTAGE_REPOSITORIES \
		-u PORTDIR \
		-u PORTDIR_OVERLAY \
		PYTHONPATH="${D}${sitedir}${PYTHONPATH:+:${PYTHONPATH}}" \
		"${PYTHON}" -m portage._compat_upgrade.default_locations || die

	env -u BINPKG_COMPRESS -u PORTAGE_REPOSITORIES \
		PYTHONPATH="${D}${sitedir}${PYTHONPATH:+:${PYTHONPATH}}" \
		"${PYTHON}" -m portage._compat_upgrade.binpkg_compression || die

	env -u FEATURES -u PORTAGE_REPOSITORIES \
		PYTHONPATH="${D}${sitedir}${PYTHONPATH:+:${PYTHONPATH}}" \
		"${PYTHON}" -m portage._compat_upgrade.binpkg_multi_instance || die

	# elog dir must exist to avoid logrotate error for bug #415911.
	# This code runs in preinst in order to bypass the mapping of
	# portage:portage to root:root which happens after src_install.
	keepdir /var/log/portage/elog
	# This is allowed to fail if the user/group are invalid for prefix users.
	if chown portage:portage "${ED}"/var/log/portage{,/elog} 2>/dev/null ; then
		chmod g+s,ug+rwx "${ED}"/var/log/portage{,/elog}
	fi

	if has_version "<${CATEGORY}/${PN}-2.3.77"; then
		elog "The emerge --autounmask option is now disabled by default, except for"
		elog "portions of behavior which are controlled by the --autounmask-use and"
		elog "--autounmask-license options. For backward compatibility, previous"
		elog "behavior of --autounmask=y and --autounmask=n is entirely preserved."
		elog "Users can get the old behavior simply by adding --autounmask to the"
		elog "make.conf EMERGE_DEFAULT_OPTS variable. For the rationale for this"
		elog "change, see https://bugs.gentoo.org/658648."
	fi
}

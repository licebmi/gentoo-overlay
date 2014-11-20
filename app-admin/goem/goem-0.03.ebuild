# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="Go extension manager"
HOMEPAGE="https://github.com/adjust/goem"
SRC_URI=""

LICENSE="BEER-WARE"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/go"

RDEPEND="${DEPEND}"

EGIT_REPO_URI="https://github.com/adjust/goem.git"
EGIT_BRANCH="master"

src_compile() {
	mkdir "${PORTAGE_BUILDDIR}/work/goem-0.03/build_dir"
	go build -o build_dir/goem || die "$!"
}

src_install() {
	dodir /usr/bin/
	cp "${PORTAGE_BUILDDIR}/work/goem-0.03/build_dir/goem" \
	"${D}/usr/bin/" || die
}

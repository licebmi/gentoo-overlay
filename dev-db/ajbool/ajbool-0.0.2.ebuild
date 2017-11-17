# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

POSTGRES_COMPAT=( 9.4 9.5 9.6 10 )

inherit postgres-multi

DESCRIPTION="Bool with explicit, distinct null for primary keys"
HOMEPAGE="https://github.com/adjust/ajbool"
SRC_URI="https://api.pgxn.org/dist/ajbool/${PV}/ajbool-${PV}.zip"
LICENSE="POSTGRESQL GPL-2"

KEYWORDS="~amd64"

SLOT=0

RESTRICT="test" # connects to local DB instance, which is bad

DEPEND="${POSTGRES_DEP}"
RDEPEND="${DEPEND}"

src_compile() {
	postgres-multi_foreach emake USE_PGXS=1
}

src_install() {
	postgres-multi_foreach emake DESTDIR="${D}" USE_PGXS=1 install
}

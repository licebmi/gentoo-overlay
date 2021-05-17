# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd user

DESCRIPTION="An OSS column-oriented database management system for real-time data analysis"
HOMEPAGE="https://clickhouse.yandex"

MY_PN="clickhouse"
MY_REL="lts"
MY_URI="https://github.com/ClickHouse/ClickHouse"
SRC_URI="
	${MY_URI}/releases/download/v${PV}-${MY_REL}/${MY_PN}-common-static-${PV}.tgz
	server? ( ${MY_URI}/releases/download/v${PV}-${MY_REL}/${MY_PN}-server-${PV}.tgz )
	client? ( ${MY_URI}/releases/download/v${PV}-${MY_REL}/${MY_PN}-client-${PV}.tgz )
	test? ( ${MY_URI}/releases/download/v${PV}-${MY_REL}/${MY_PN}-test-${PV}.tgz )
"

LICENSE="Apache-2.0"
KEYWORDS="~amd64"

SLOT="0"

IUSE="+client +server test"

DEPEND="
"

RDEPEND="
	${DEPEND}
"

QA_PREBUILT="
	opt/clickhouse/usr/bin/clickhouse
	opt/clickhouse/usr/bin/clickhouse-odbc-bridge
	opt/clickhouse/usr/bin/clickhouse-report
	opt/clickhouse/usr/bin/clickhouse-test
"

pkg_setup() {
	if use server; then
		enewgroup clickhouse
		enewuser clickhouse -1 -1 /var/lib/clickhouse clickhouse
	fi
}

src_unpack() {
	default

	# create merged work dir
	mkdir "${WORKDIR}"/${MY_PN}-${PV}

	# merge the directories
	cp -R "${WORKDIR}"/${MY_PN}-*/* ${MY_PN}-${PV}/

	# tidy up leftover mess
	rm -rf "${S}"/{install,usr/share/doc}
	rm -rf "${WORKDIR}"/${MY_PN}-{client,server,common-static}-${PV}
}

src_install() {

	insinto "/opt/${MY_PN}"
	doins -r *

	# common
	fperms 755 /opt/${MY_PN}/usr/bin/clickhouse{-extract-from-config,-odbc-bridge}
	# server
	use server && fperms 755 /opt/${MY_PN}/usr/bin/clickhouse{-copier,-report,-server}
	# client
	use client && fperms 755 /opt/${MY_PN}/usr/bin/clickhouse{-benchmark,-client,-compressor,-compressor,-format,-local,-obfuscator}
	# test
	use test && fperms 755 /opt/${MY_PN}/usr/bin/clickhouse-test

	dosym /opt/${MY_PN}/usr/bin/clickhouse /usr/bin/clickhouse
	dosym /opt/${MY_PN}/usr/bin/clickhouse-odbc-bridge /usr/bin/clickhouse-odbc-bridge

	dosym /usr/bin/clickhouse /usr/bin/clickhouse-extract-from-config

	if use client ; then
                dosym /usr/bin/clickhouse /usr/bin/clickhouse-benchmark
                dosym /usr/bin/clickhouse /usr/bin/clickhouse-client
                dosym /usr/bin/clickhouse /usr/bin/clickhouse-compressor
                dosym /usr/bin/clickhouse /usr/bin/clickhouse-format
                dosym /usr/bin/clickhouse /usr/bin/clickhouse-local
                dosym /usr/bin/clickhouse /usr/bin/clickhouse-obfuscator
	fi

	if use server ; then

		dosym /usr/bin/clickhouse /usr/bin/clickhouse-copier
		dosym /usr/bin/clickhouse /usr/bin/clickhouse-report
		dosym /usr/bin/clickhouse /usr/bin/clickhouse-server

		newinitd "${FILESDIR}"/clickhouse-server.initd-r1 clickhouse-server
		newconfd "${FILESDIR}"/clickhouse-server.confd clickhouse-server

		systemd_dounit "${FILESDIR}"/clickhouse-server.service

		keepdir /var/log/clickhouse-server
		chown clickhouse:clickhouse "${D}"/var/log/clickhouse-server
	fi

	if use test ; then
		dosym /usr/bin/clickhouse /usr/bin/clickhouse-test
	fi

	keepdir /var/log/clickhouse-server
	chown clickhouse:clickhouse "${D}"/var/log/clickhouse-server

	insinto /etc/security/limits.d/
	doins  "${S}"/etc/security/limits.d/clickhouse.conf /etc/security/limits.d/
}

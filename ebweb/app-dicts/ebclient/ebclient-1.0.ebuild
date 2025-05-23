# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Simple program for reading EPWING dictionaries"
HOMEPAGE="https://github.com/sagan/ebclient"
SRC_URI="https://github.com/ktkovachev/ebclient/archive/refs/tags/v1.0.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+static-libs"

DEPEND="dev-libs/ebu[static-libs] dev-libs/mxml[static-libs] sys-libs/zlib[static-libs]"
RDEPEND="${DEPEND}"
BDEPEND="dev-build/libtool"

src_compile() {
	cd src
	sed -e "s/mxml/mxml4/" Makefile -i || die "unable to patch mxml library path!"
	emake
}

src_install() {
	mkdir -p "${D}"/usr/bin/ || die "unable to create install directory!"
	install src/ebclient "${D}"/usr/bin/ebclient || die "couldn't install!"
}

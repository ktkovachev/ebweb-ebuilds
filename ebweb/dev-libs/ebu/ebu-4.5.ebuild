# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Library for UTF-8-enabled reading of EPWING dictionary files"
HOMEPAGE="http://green.ribbon.to/~ikazuhiro/dic/ebu.html"
SRC_URI="https://github.com/ktkovachev/ebu/archive/refs/tags/v4.5.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+static-libs"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="dev-build/libtool"

src_configure() {
	#econf --enable-static
	autoconf
	#econf \
	#	$(use_enable static-libs)

	./configure --prefix=/usr --libdir=/usr/lib64 --sysconfdir=/etc
}

src_compile() {
	emake
}

src_install() {
	#emake install
	emake DESTDIR="${D}" install
#	emake \
#		prefix="${D}"/usr \
#		mandir="${D}"/usr/share/man \
#		infodir="${D}"/usr/share/info \
#		libdir="${D}"/usr/$(get_libdir) \
#		install

}

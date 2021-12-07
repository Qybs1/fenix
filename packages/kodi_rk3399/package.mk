PKG_NAME="kodi_rk3399"
PKG_VERSION="32b130d4dbc705043ec9d190f413283f7eb52039"
PKG_SHA256="8882bb8f55dd5ab6a644a815334bc2b669a1f3e3994a247661fc6f0080585074"
PKG_SOURCE_DIR="kodi_rk3399-${PKG_VERSION}*"
PKG_SITE="$GITHUB_URL/numbqq/kodi_rk3399"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_ARCH="arm64"
PKG_LICENSE="GPL"
PKG_SHORTDESC="Kodi for  RK3399"
PKG_SOURCE_NAME="kodi_rk3399-${PKG_VERSION}.tar.gz"
PKG_NEED_BUILD="NO"

make_target() {
	:
}

makeinstall_target() {
	mkdir -p $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/kodi
	# Remove old debs
	rm -rf $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/kodi/*
	cp ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/*.deb $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/kodi
	cp -r ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/deps $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/kodi
	cp -r ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/dev $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/kodi
}


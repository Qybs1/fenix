PKG_NAME="optee_video_firmware_deb_aml"
PKG_VERSION="b54a9f6ecc1267f6043822b6352bd74bd2876c5e"
PKG_SHA256="901b4bac72eea51524f57100128ed4026b973256267919884f08c91de3977157"
PKG_SOURCE_DIR="${PKG_NAME}-${PKG_VERSION}*"
PKG_SITE="$GITHUB_URL/numbqq/${PKG_NAME}"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_ARCH="arm aarch64"
PKG_LICENSE="GPL"
PKG_SHORTDESC="Optee Video Firmware"
PKG_SOURCE_NAME="${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_NEED_BUILD="NO"


make_target() {
	:
}

makeinstall_target() {
	mkdir -p $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/${PKG_NAME}
	# Remove old debs
	rm -rf $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/${PKG_NAME}/*
	cp ${DISTRIB_RELEASE}/${DISTRIB_ARCH}/$KHADAS_BOARD/*.deb $BUILD_DEBS/$VERSION/$KHADAS_BOARD/${DISTRIBUTION}-${DISTRIB_RELEASE}/${PKG_NAME}
}

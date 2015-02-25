################################################################################
#
# xcb-util-render
#
################################################################################

XCB_UTIL_RENDER_VERSION = 0.3.9
XCB_UTIL_RENDER_SOURCE = xcb-util-renderutil-$(XCB_UTIL_RENDER_VERSION).tar.bz2
XCB_UTIL_RENDER_SITE = http://xcb.freedesktop.org/dist/

# unfortunately, no license file
XCB_UTIL_RENDER_LICENSE = MIT

XCB_UTIL_RENDER_INSTALL_STAGING = YES
XCB_UTIL_RENDER_DEPENDENCIES = libxcb

$(eval $(autotools-package))

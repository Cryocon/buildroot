################################################################################
#
# efl18
#
################################################################################

EFL18_VERSION = 1.13.0
EFL18_SOURCE = efl-$(EFL18_VERSION).tar.gz
EFL18_SITE = http://download.enlightenment.org/rel/libs/efl/
EFL18_LICENSE = LGPLv2.1+ GPLv2 BSD SMALL
LIBEINA_LICENSE_FILES = COPYING licenses/COPYING.LGPL licenses/COPYING.GPL licenses/COPYING.BSD licenses/COPYING.SMALL
EFL18_INSTALL_STAGING = YES
EFL18_DEPENDENCIES = host-pkgconf 
EFL18_TARGET_DEPENDENCIES += luajit	# libedje 
EFL18_CONF_OPT += --disable-fribidi	# libevas
EFL18_DEPENDENCIES += dbus	# lieldbus
EFL18_CONF_OPT += --with-opengl=none
EFL18_CONF_OPT += --disable-image-loader-gif --disable-image-loader-tiff 
EFL18_CONF_OPT += --disable-gstreamer1
EFL18_CONF_OPT += --enable-fb # libelementary
EFL18_CONF_OPT += --disable-libmount # libeeze
EFL18_CONF_OPT += --disable-audio # libecore_audio
#EFL18_CONF_OPT += --with-x11=xlib # requires xlib_libXprint
#EFL18_DEPENDENCIES += xlib_libXcomposite xlib_libXpm
EFL18_CONF_OPT += --with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen
EFL18_CONF_OPT += --with-eolian-cxx=$(HOST_DIR)/usr/bin/eolian_cxx
EFL18_CONF_OPT += --with-elua=$(HOST_DIR)/usr/bin/elua # also need /usr/share populated
HOST_EFL18_CONF_OPT = --enable-edje-cc
EFL18_CONF_OPT += --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
#EFL18_CONF_OPT += --disable-cxx-bindings # disable eolian
EFL18_CONF_OPT += --disable-physics --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba
#EFL18_CONF_OPT += --disable-gl-sdl --disable-gl --disable-gl-xlib --disable-gl-xcb

#ifeq ($(BR2_PACKAGE_LIBECORE_X_XCB),y)
EFL18_CONF_OPT += -with-x11=xcb # libecore_x with xlib requires Print.h
EFL18_TARGET_DEPENDENCIES += libxcb xlib_libX11 xcb-util pixman xcb-util-keysyms xcb-util-image xcb-util-wm xcb-util-render
#endif

# src/util/makekeys is executed at build time to generate
# ecore_xcb_keysym_table.h, so it should get compiled for the host.
# The ecore makefile unfortunately doesn't know about cross
# compilation so this doesn't work.  Long term, we should probably
# teach it about CC_FOR_BUILD, but for now simply build makekeys by
# hand in advance
define EFL18_BUILD_MAKEKEYS_FOR_HOST
        $(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/src/utils/ecore makekeys.o makekeys && \
        cp -a $(@D)/src/utils/ecore/makekeys.o $(@D)/src/utils/ecore/utils_ecore_makekeys-makekeys.o
endef
EFL18_POST_EXTRACT_HOOKS += EFL18_BUILD_MAKEKEYS_FOR_HOST

HOST_EFL18_CONF_OPT += --with-crypto=none

$(eval $(autotools-package))
$(eval $(host-autotools-package))

include $(sort $(wildcard package/efl18/libelementary18/*.mk))


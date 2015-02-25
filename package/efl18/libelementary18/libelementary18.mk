################################################################################
#
# libelementary
#
################################################################################

LIBELEMENTARY18_VERSION = $(EFL18_VERSION)
LIBELEMENTARY18_SOURCE = elementary-$(LIBELEMENTARY18_VERSION).tar.gz
LIBELEMENTARY18_SITE = http://download.enlightenment.org/rel/libs/elementary
LIBELEMENTARY18_LICENSE = LGPLv2.1
LIBELEMENTARY18_LICENSE_FILES = COPYING

LIBELEMENTARY18_INSTALL_STAGING = YES

LIBELEMENTARY18_DEPENDENCIES = efl18

LIBELEMENTARY18_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet
LIBELEMENTARY18_CONF_OPT += --with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen
LIBELEMENTARY18_CONF_OPT += --with-eolian-cxx=$(HOST_DIR)/usr/bin/eolian_cxx
LIBELEMENTARY18_CONF_OPT += --disable-elm-prefs-cc
LIBELEMENTARY18_CONF_OPT += --with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc

#LIBELEMENTARY18_CONF_OPT += --disable-ecore-x
# libethumb_client is only built when ethumbd is built.
# ethumbd is only built if edbus is built.
#ifeq ($(BR2_PACKAGE_LIBETHUMB)$(BR2_PACKAGE_LIBEDBUS),yy)
#LIBELEMENTARY_DEPENDENCIES += libethumb
#LIBELEMENTARY_CONF_OPT += --enable-ethumb
#else
LIBELEMENTARY18_CONF_OPT += --disable-ethumb
#endif

$(eval $(autotools-package))

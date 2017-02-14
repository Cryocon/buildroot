################################################################################
#
# FLEK
#
################################################################################

FLEK_VERSION = master
FLEK_SOURCE = flek-$(FLEK_VERSION)-source.tar.gz
FLEK_SITE = ../src/flek
FLEK_SITE_METHOD = local
FLEK_INSTALL_STAGING = YES
FLEK_DEPENDENCIES = fltk
#FLEK_CONFIG_SCRIPTS = flek-config
FLEK_LICENSE = LGPLv2
FLEK_LICENSE_FILES = README

FLEK_CONF_OPTS = --disable-gl --disable-jpeg --with-fltk=$(TARGET_DIR)/usr 
FLEK_CONF_OPTS += --exec-prefix=$(TARGET_DIR)/usr --prefix=$(STAGING_DIR)/usr

$(eval $(autotools-package))

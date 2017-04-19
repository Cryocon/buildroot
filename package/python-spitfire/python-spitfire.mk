#############################################################
#
# python-spitfire
#
#############################################################

PYTHON_SPITFIRE_VERSION = 4591335
PYTHON_SPITFIRE_SITE    = $(call github,youtube,spitfire,$(PYTHON_SPITFIRE_VERSION))
PYTHON_SPITFIRE_DEPENDENCIES = host-python-yaml2 python
PYTHON_SPITFIRE_LICENSE = BSD-3c
PYTHON_SPITFIRE_LICENSE_FILES = LICENSE
PYTHON_SPITFIRE_SETUP_TYPE = distutils

define PYTHON_SPITFIRE_BUILD_CMDS
        (cd $(@D); \
                CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
                LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/" \
		LDSHARED="$(TARGET_CC) -shared -rdynamic --PIC" \
	        $(HOST_DIR)/usr/bin/python setup.py build_ext \
        	--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR))
        (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build_scripts)
endef

define PYTHON_SPITFIRE_INSTALL_TARGET_CMDS
	(cd $(@D); PYTHONPATH=$(TARGET_DIR)/usr/lib/python2.7/site-packages $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))
$(eval $(host-python-package))

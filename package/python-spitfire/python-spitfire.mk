#############################################################
#
# python-spitfire
#
#############################################################

PYTHON_SPITFIRE_VERSION = 163
#PYTHON_SPITFIRE_SOURCE  = spitfire-$(PYTHON_SPITFIRE_VERSION).tar.gz
PYTHON_SPITFIRE_SITE    = http://spitfire.googlecode.com/svn/trunk/
PYTHON_SPITFIRE_SITE_METHOD = svn
PYTHON_SPITFIRE_DEPENDENCIES = python

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
	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
endef

$(eval $(generic-package))

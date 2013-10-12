################################################################################
#
# netcat
#
################################################################################

NETCAT_VERSION = 5
# NETCAT_SOURCE = netcat-$(NETCAT_VERSION).tar.gz
NETCAT_SITE = http://openbsd-netcat.googlecode.com/svn/trunk/
NETCAT_SITE_METHOD=svn
NETCAT_LICENSE = BSD-3c


define NETCAT_BUILD_CMDS
	$(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
endef

define NETCAT_INSTALL_TARGET_CMDS
	cp $(@D)/nc $(TARGET_DIR)/usr/bin
endef

define NETCAT_CLEAN_CMDS
	-$(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) clean
endef

define NETCAT_UNINSTALL_TARGET_CMDS
	rm $(TARGET_DIR)/usr/bin/nc
endef

$(eval $(generic-package))

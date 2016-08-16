################################################################################
#
# epics-base
#
################################################################################

EPICS_BASE_VERSION = 3.15.4
EPICS_BASE_SOURCE = base-$(EPICS_BASE_VERSION).tar.gz
EPICS_BASE_SITE = http://aps.anl.gov/epics/download/base
EPICS_BASE_LICENSE_FILES = LICENSE
EPICS_BASE_INSTALL_STAGING = YES

define HOST_EPICS_BASE_BUILD_CMDS
	mkdir -p "$(HOST_DIR)/usr/lib/epics"
	$(MAKE) -C $(@D) CROSS_COMPILER_TARGET_ARCHS="linux-$(ARCH)" INSTALL_DIR="$(HOST_DIR)/usr/lib/epics" host
endef

define EPICS_BASE_CONFIGURE_CMDS
	echo "GNU_DIR = $(HOST_DIR)/usr" > $(@D)/configure/os/CONFIG_SITE.linux-$(HOSTARCH).linux-$(ARCH)
	echo "GNU_TARGET = $(ARCH)-linux" >> $(@D)/configure/os/CONFIG_SITE.linux-$(HOSTARCH).linux-$(ARCH)
endef

define EPICS_BASE_BUILD_CMDS
	$(MAKE) -C $(@D) CROSS_COMPILER_TARGET_ARCHS="linux-$(ARCH)" install.linux-$(ARCH)
endef

define EPICS_BASE_HOST_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/linux-$(HOSTARCH)/* $(HOST_DIR)/usr/lib/epics/bin
	cp -dRf $(@D)/templates $(HOST_DIR)/usr/lib/epics
	cp -dRf $(@D)/configure $(HOST_DIR)/usr/lib/epics
endef

define EPICS_BASE_INSTALL_STAGING_CMDS
	mkdir -p "$(STAGING_DIR)/usr/lib/epics/bin"
	cp -dRf $(@D)/startup $(@D)/include $(@D)/configure $(@D)/templates $(@D)/bin $(@D)/lib $(STAGING_DIR)/usr/lib/epics
	$(INSTALL) -D -m 0755 $(@D)/lib/linux-$(ARCH)/* $(STAGING_DIR)/usr/lib/
endef

define EPICS_BASE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/linux-$(ARCH)/* $(TARGET_DIR)/usr/bin
	-$(INSTALL) -D -m 0755 $(@D)/lib/linux-$(ARCH)/lib*.so* $(TARGET_DIR)/usr/lib
endef

$(eval $(generic-package))
$(eval $(host-generic-package))

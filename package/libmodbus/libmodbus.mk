#############################################################
#
# libmodbus
#
#############################################################
LIBMODBUS_VERSION = 3.0.6
LIBMODBUS_SITE = http://libmodbus.org/releases/
LIBMODBUS_INSTALL_STAGING = YES

$(eval $(autotools-package))

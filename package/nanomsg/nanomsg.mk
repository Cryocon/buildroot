################################################################################
#
# nanomsg
#
################################################################################

NANOMSG_VERSION = 0.4-beta
NANOMSG_SITE = http://download.nanomsg.org/
NANOMSG_LICENSE = MIT/X11
NANOMSG_LICENSE_FILES = COPYING
NANOMSG_INSTALL_STAGING = YES

$(eval $(autotools-package))

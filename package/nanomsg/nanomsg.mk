################################################################################
#
# nanomsg
#
################################################################################

NANOMSG_VERSION = 1.0.0
NANOMSG_SOURCE = $(NANOMSG_VERSION).tar.gz
NANOMSG_SITE = https://github.com/nanomsg/nanomsg/archive
NANOMSG_LICENSE = MIT/X11
NANOMSG_LICENSE_FILES = COPYING
NANOMSG_INSTALL_STAGING = YES

$(eval $(cmake-package))

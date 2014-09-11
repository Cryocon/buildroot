#############################################################
#
# mosh
#
#############################################################

MOSH_SITE = http://mosh.mit.edu
MOSH_VERSION = 1.2.4
MOSH_SOURCE = mosh-$(MOSH_VERSION).tar.gz
MOSH_DEPENDENCIES = ncurses zlib protobuf openssl

$(eval $(autotools-package))

################################################################################
#
# python-gevent
#
################################################################################

PYTHON_GEVENT_VERSION = 1.0.1
PYTHON_GEVENT_SOURCE  = gevent-$(PYTHON_GEVENT_VERSION).tar.gz
PYTHON_GEVENT_SITE    = https://pypi.python.org/packages/source/g/gevent/
PYTHON_GEVENT_DEPENDENCIES = libev python-greenlet
PYTHON_GEVENT_SETUP_TYPE = distutils

define PYTHON_GEVENT_EXTRACT_CMDS
	gzip -c > $(@D)
	tar xf $(@D) $(DL_DIR)/$(PYTHON_GEVENT_SOURCE)
	rm -rf $(@D)/libev
	ln -s ../libev-4.11 $(@D)/libev
endef

$(eval $(python-package))

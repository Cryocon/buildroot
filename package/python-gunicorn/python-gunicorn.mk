################################################################################
#
# python-gunicorn
#
################################################################################

PYTHON_GUNICORN_VERSION = 19.4.4
PYTHON_GUNICORN_SOURCE  = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
PYTHON_GUNICORN_SITE    = ../src/gunicorn
PYTHON_GUNICORN_SITE_METHOD=local
PYTHON_GUNICORN_DEPENDENCIES = libev python-greenlet python-gevent
PYTHON_GUNICORN_SETUP_TYPE = distutils

define PYTHON_GUNICORN_EXTRACT_CMDS
	tar xzf $(DL_DIR)/$(PYTHON_GUNICORN_SOURCE) -C $(@D) --strip-components=1
	rm -rf $(@D)/libev
	ln -s ../libev-4.11 $(@D)/libev
endef

ifneq ($(BR2_PACKAGE_PYTHON3),y)
define PYTHON_GUNICORN_REMOVE_GAIOHTTP
        $(RM) $(@D)/gunicorn/workers/_gaiohttp.py
endef
PYTHON_GUNICORN_PRE_BUILD_HOOKS += PYTHON_GUNICORN_REMOVE_GAIOHTTP
endif

$(eval $(python-package))

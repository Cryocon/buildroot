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

# At the end of the build, we try to compile all py files using the host python
# that has been built.
# The GAIO HTTP Worker is only compatible with Python3.4.2 and up. So don't try
# to compile it with python 2.x
ifeq ($(BR2_PACKAGE_PYTHON),y)
define PYTHON_GUNICORN_REMOVE_GAIO_WORKER
	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/ \
		-name "_gaiohttp.py" -exec rm -f {} \;
endef
PYTHON_GUNICORN_POST_INSTALL_TARGET_HOOKS += PYTHON_GUNICORN_REMOVE_GAIO_WORKER
endif

$(eval $(python-package))

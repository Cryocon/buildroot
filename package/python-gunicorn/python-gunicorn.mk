################################################################################
#
# python-gunicorn
#
################################################################################

PYTHON_GUNICORN_VERSION = 19.4.4
PYTHON_GUNICORN_SOURCE  = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
PYTHON_GUNICORN_SITE    = https://pypi.python.org/packages/source/g/gunicorn/
PYTHON_GUNICORN_DEPENDENCIES = libev python-greenlet
PYTHON_GUNICORN_SETUP_TYPE = distutils

define PYTHON_GUNICORN_EXTRACT_CMDS
	tar xzf $(DL_DIR)/$(PYTHON_GUNICORN_SOURCE) -C $(@D) --strip-components=1
	rm -rf $(@D)/libev
	ln -s ../libev-4.11 $(@D)/libev
endef

$(eval $(python-package))

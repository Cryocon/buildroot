################################################################################
#
# python-tornado
#
################################################################################

PYTHON_TORNADO_VERSION = 4.4.2
PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
PYTHON_TORNADO_SITE = https://pypi.python.org/packages/1e/7c/ea047f7bbd1ff22a7f69fe55e7561040e3e54d6f31da6267ef9748321f98
PYTHON_TORNADO_LICENSE = Apache-2.0
PYTHON_TORNADO_SETUP_TYPE = setuptools

define PYTHON_TORNADO_REMOVE_TEST
        rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/tornado/test
endef

PYTHON_TORNADO_POST_INSTALL_TARGET_HOOKS += PYTHON_TORNADO_REMOVE_TEST


$(eval $(python-package))

################################################################################
#
# python-ipython
#
# Note that python-ipython will build Notebook even without pyzmq, and pyzmq
# detection will fail.
################################################################################

PYTHON_IPYTHON_VERSION = 1.1.1-dev
PYTHON_IPYTHON_SITE = ../src/ipython
PYTHON_IPYTHON_SITE_METHOD=local
PYTHON_IPYTHON_LICENSE = BSD-3c
PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
PYTHON_IPYTHON_SETUP_TYPE = distutils

ifeq ($(BR2_PACKAGE_PYTHON_IPYTHON_NOTEBOOK),y)
PYTHON_IPYTHON_DEPENDENCIES = python-pyzmq python-tornado python-jinja2
endif

$(eval $(python-package))

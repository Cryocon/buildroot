################################################################################
#
# python-ipython
#
################################################################################

PYTHON_IPYTHON_VERSION = 1.1.1-dev
PYTHON_IPYTHON_SITE = ~/src/ipython
PYTHON_IPYTHON_SITE_METHOD=local
PYTHON_IPYTHON_LICENSE = BSD-3c
PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
PYTHON_IPYTHON_SETUP_TYPE = distutils

$(eval $(python-package))

################################################################################
#
# python-ipython
#
# Note that python-ipython will build Notebook even without pyzmq, and pyzmq
# detection will fail.
################################################################################

PYTHON_IPYTHON_VERSION = 1.1.1-dev
PYTHON_IPYTHON_SITE = ~/src/ipython
PYTHON_IPYTHON_SITE_METHOD=local
PYTHON_IPYTHON_SETUP_TYPE = distutils
PYTHON_IPYTHON_DEPENDENCIES = python-pyzmq python-tornado python-additional

$(eval $(python-package))

#############################################################
#
# python-spitfire
#
#############################################################

PYTHON_SPITFIRE_VERSION = master
PYTHON_SPITFIRE_SITE    = ../src/spitfire
PYTHON_SPITFIRE_SITE_METHOD = local
PYTHON_SPITFIRE_DEPENDENCIES = python
PYTHON_SPITFIRE_LICENSE = BSD-3c
PYTHON_SPITFIRE_LICENSE_FILES = LICENSE
PYTHON_SPITFIRE_SETUP_TYPE = setuptools


$(eval $(python-package))
$(eval $(host-python-package))

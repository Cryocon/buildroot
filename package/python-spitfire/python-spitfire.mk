#############################################################
#
# python-spitfire
#
#############################################################

PYTHON_SPITFIRE_VERSION = 4e974e996bb66bf13440a99c23eeb0183c64b235
PYTHON_SPITFIRE_SITE    = https://github.com/youtube/spitfire.git
PYTHON_SPITFIRE_SITE_METHOD = git
PYTHON_SPITFIRE_DEPENDENCIES = python
PYTHON_SPITFIRE_LICENSE = BSD-3c
PYTHON_SPITFIRE_LICENSE_FILES = LICENSE
PYTHON_SPITFIRE_SETUP_TYPE = setuptools


$(eval $(python-package))
$(eval $(host-python-package))

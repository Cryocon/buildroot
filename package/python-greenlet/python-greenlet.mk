################################################################################
#
# python-greenlet
#
################################################################################

PYTHON_GREENLET_VERSION = 0.4.2
PYTHON_GREENLET_SOURCE  = greenlet-$(PYTHON_GREENLET_VERSION).zip
PYTHON_GREENLET_SITE    = https://pypi.python.org/packages/source/g/greenlet
PYTHON_GREENLET_SETUP_TYPE = distutils

define PYTHON_GREENLET_EXTRACT_CMDS
        unzip -d $(@D) $(DL_DIR)/$(PYTHON_GREENLET_SOURCE)
        mv $(@D)/*/* $(@D)
endef


$(eval $(python-package))

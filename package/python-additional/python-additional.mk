#############################################################
#
# python-additional
#
#############################################################

PYTHON_ADDITIONAL_DEPENDENCIES = python host-python-setuptools \
	python-setuptools python-greenlet
PYTHON_ADDITIONAL_VERSION =
PYTHON_ADDITIONAL_SOURCE  =
PYTHON_ADDITIONAL_SITE    =

#define PYTHON_ADDITIONAL_BUILD_CMDS
#	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
#endef

define PYTHON_ADDITIONAL_INSTALL_TARGET_CMDS
	(export PYTHONPATH=$(TARGET_DIR)/usr/lib/python2.7/site-packages; cd $(@D); $(HOST_DIR)/usr/bin/easy_install --prefix=$(TARGET_DIR)/usr --always-unzip --build-directory $(BUILD_DIR)/python-additional --local-snapshots-ok $(call qstrip,$(BR2_PACKAGE_PYTHON_ADDITIONAL_PACKAGES)))
endef

$(eval $(generic-package))

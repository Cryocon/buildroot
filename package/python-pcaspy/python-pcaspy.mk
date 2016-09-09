################################################################################
#
# python-pcaspy
#
################################################################################

PYTHON_PCASPY_VERSION = 0.6.2
PYTHON_PCASPY_SOURCE = pcaspy-$(PYTHON_PCASPY_VERSION).tar.gz
PYTHON_PCASPY_SITE = https://pypi.python.org/packages/11/6a/e6b230011cb9e9578b8dd65ff2bade8dc564cc514789e4205d80a6776472
#https://pypi.python.org/packages/11/6a/e6b230011cb9e9578b8dd65ff2bade8dc564cc514789e4205d80a6776472/pcaspy-0.6.2.tar.gz#md5=9e105aeb7db9f5254f847924ea188332
#https://pypi.python.org/packages/96/5d/ff472313e8f337d5acda5d56e6ea79a43583cc8771b34c85a1f458e197c3/tornado-4.4.1.tar.gz#md5=fff8a7d7f580b04bacc2ffe7ddf41133
PYTHON_PCASPY_LICENSE = BSD
PYTHON_PCASPY_SETUP_TYPE = setuptools

PYTHON_PCASPY_ENV += EPICS_BASE=$(STAGING_DIR)/usr/lib/epics
PYTHON_PCASPY_ENV += EPICS_HOST_ARCH=linux-$(ARCH)

define PYTHON_PCASPY_REMOVE_TEST
        rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pcaspy/test
endef

PYTHON_PCASPY_POST_INSTALL_TARGET_HOOKS += PYTHON_PCASPY_REMOVE_TEST


$(eval $(python-package))


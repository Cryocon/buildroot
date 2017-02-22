################################################################################
#
# python-gevent
#
################################################################################

PYTHON_GEVENT_VERSION = 1.2.1
PYTHON_GEVENT_SOURCE = gevent-$(PYTHON_GEVENT_VERSION).tar.gz
PYTHON_GEVENT_SITE = https://pypi.python.org/packages/54/dd/17dc7e899ac7c1de2d19b367b29d90fdb4cfe83bda8c2581464906c9399d
PYTHON_GEVENT_SETUP_TYPE = setuptools
PYTHON_GEVENT_LICENSE = MIT
PYTHON_GEVENT_LICENSE_FILES = LICENSE deps/libev/LICENSE

ifneq ($(BR2_PACKAGE_PYTHON3),y)
define PYTHON_GEVENT_REMOVE_SOCKET3
        $(RM) $(@D)/src/gevent/_socket3.py
endef
PYTHON_GEVENT_PRE_BUILD_HOOKS += PYTHON_GEVENT_REMOVE_SOCKET3
endif

$(eval $(python-package))

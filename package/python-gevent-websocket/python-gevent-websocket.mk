################################################################################
#
# python-gevent-websocket
#
################################################################################

PYTHON_GEVENT_WEBSOCKET_VERSION = 0.9.5
PYTHON_GEVENT_WEBSOCKET_SOURCE = gevent-websocket-$(PYTHON_GEVENT_WEBSOCKET_VERSION).tar.gz
PYTHON_GEVENT_WEBSOCKET_SITE = https://pypi.python.org/packages/de/93/6bc86ddd65435a56a2f2ea7cc908d92fea894fc08e364156656e71cc1435
PYTHON_GEVENT_WEBSOCKET_SETUP_TYPE = setuptools
PYTHON_GEVENT_WEBSOCKET_LICENSE = Apache-2.0
PYTHON_GEVENT_WEBSOCKET_LICENSE_FILES = LICENSE

$(eval $(python-package))

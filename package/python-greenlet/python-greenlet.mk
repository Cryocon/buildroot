################################################################################
#
# python-greenlet
#
################################################################################

PYTHON_GREENLET_SETUP_TYPE = distutils
PYTHON_GREENLET_VERSION = 0.4.12
PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
PYTHON_GREENLET_SITE = https://pypi.python.org/packages/be/76/82af375d98724054b7e273b5d9369346937324f9bcc20980b45b068ef0b0
PYTHON_GREENLET_LICENSE = MIT
PYTHON_GREENLET_LICENSE_FILES = LICENSE

$(eval $(python-package))

################################################################################
#
# python-monotonic
#
################################################################################

PYTHON_MONOTONIC_VERSION = 1.3
PYTHON_MONOTONIC_SOURCE = monotonic-$(PYTHON_MONOTONIC_VERSION).tar.gz
PYTHON_MONOTONIC_SITE = https://pypi.python.org/packages/96/b3/3e9fa0bdf132a971571cbf0e3f0c8b38834f4f7af8ca9523794f4f5895e0
PYTHON_MONOTONIC_SETUP_TYPE = setuptools
PYTHON_MONOTONIC_LICENSE = Apache-2.0
PYTHON_MONOTONIC_LICENSE_FILES = LICENSE

$(eval $(python-package))

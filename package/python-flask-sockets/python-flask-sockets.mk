################################################################################
#
# python-flask-sockets
#
################################################################################

PYTHON_FLASK_SOCKETS_VERSION = 0.2.1
PYTHON_FLASK_SOCKETS_SOURCE = Flask-Sockets-$(PYTHON_FLASK_SOCKETS_VERSION).tar.gz
PYTHON_FLASK_SOCKETS_SITE = https://pypi.python.org/packages/54/ce/9870fb46283b6a1130a3893e5640064f957d62d48ed2bc3cd84a8f529620
PYTHON_FLASK_SOCKETS_SETUP_TYPE = setuptools
PYTHON_FLASK_SOCKETS_LICENSE = BSD

$(eval $(python-package))

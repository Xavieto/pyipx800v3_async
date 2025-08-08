# Assumptions:
# 1. You have installed twine and wheel (pip install twine wheel)
# 2. You have created a .pypirc file with your login credentials for both PyPI and testpypi.python.org (see https://packaging.python.org/distributing/#create-an-account)

SHELL=/bin/bash
PYTHON=/usr/bin/python3  # Change this to "python" if you're using Python 2
PKG_NAME=pyipx800v3_async  # Change to the name of your package
include config.env
export

default: | clean

init_configenv:
	@echo "IPX800_HOST=" > config.env
	@echo "IPX800_USER=" >> config.env
	@echo "IPX800_PASS=" >> config.env

install_testenv:
	@sudo apt install python3-venv
	@${PYTHON} -m venv venv

clean_testenv:
	@rm -rf venv include
	@find -type d -name __pycache__ -exec rm -rf {} \;

unittests:
	( \
       source venv/bin/activate; \
       python -m pip install -r requirements.txt; \
	   python -m unittest -v tests/unittests.py \
    )

install:
	@${PYTHON} -m pip install --upgrade build twine pip

clean:
	@echo "Removing the build/ dist/ and *.egg-info/ directories"
	@rm -rf build dist src/*.egg-info src/pyipx800v3_async/__pycache__

build:
	@echo "Bundling the code"; echo
	@${PYTHON} -m build

upload:
	@echo "Uploading built package to PyPI"
	@${PYTHON} -m twine upload dist/*

upload_test:
	@echo; echo "Uploading built package to Test PyPI"
	@${PYTHON} -m twine upload dist/* -r testpypi
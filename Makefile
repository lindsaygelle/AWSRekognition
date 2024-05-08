ifndef VERBOSE
MAKEFLAGS += --no-print-directory
endif
SHELL := /bin/bash
.DEFAULT_GOAL := help

help:
	@ echo "Use one of the following targets:"
	@ tail -n +8 Makefile |\
	egrep "^[a-z]+[\ :]" |\
	tr -d : |\
	tr " " "/" |\
	sed "s/^/ - /g"
	@ echo "Read the Makefile for further details"

clean:
	@ echo "Cleaning old files..."
	@ rm -rf **/.pytest_cache
	@ rm -rf .tox
	@ rm -rf dist
	@ rm -rf build
	@ rm -rf **/__pycache__
	@ rm -rf *.egg-info
	@ rm -rf .coverage*
	@ rm -rf **/*.pyc
	@ rm -rf env
	@ rm -rf local
	@ echo "All done!"

env environment:
	@ echo "Activating Python environment"
	@ bash --rcfile "./env/bin/activate"
	@ echo "Done!"

fmt format:
	@ terraform fmt \
		-recursive

requirements:
	@ if [ -z "${VIRTUAL_ENV}" ]; then \
		echo "Not inside a virtualenv."; \
		exit 1; \
	fi
	@ echo "Upgrading pip..."
	@ pip install --upgrade pip
	@ echo "Updating pip packages:"
	@ pip install -r "./requirements.txt"
	@ echo "Self installing this package in edit mode:"
	@ pip install -e .
	@ echo "You are ready to go ;-)"

venv virtualenv:
	@ echo "Creating a new virtualenv..."
	@ rm -rf env || true
	@ python -m venv env
	@ echo "Done, now you need to activate it. Run:"
	@ echo "source env/bin/activate" or "make env"

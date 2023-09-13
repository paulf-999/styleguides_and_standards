SHELL = /bin/sh

#================================================================
# Usage
#================================================================
# make installations	# install the package for the first time, managing dependencies & performing a housekeeping cleanup too
# make deps		# just install the dependencies
# make install		# perform the end-to-end install
# make clean		# perform a housekeeping cleanup

#=======================================================================
# Variables
#=======================================================================
.EXPORT_ALL_VARIABLES:

CONFIG_FILE := config.yaml # input config file
PIP_INSTALL_CMD=pip3 install -q --disable-pip-version-check

# setup colour formatting
RED := '\033[0;31m'
YELLOW := '\033[0;33m'
GREEN := '\033[0;32m'
PURPLE := '\033[0;35m'
CYAN := '\033[0;36m'
COLOUR_OFF := '\033[0m' # Text Reset
#=======================================================================
# Targets
#=======================================================================
all: deps install clean
.PHONY: all

deps: get_ips
	@echo "----------------------------------------------------------------------------------------------------------------------"
	@echo "${YELLOW}Target: 'deps'. Download the relevant pip package dependencies (note: ignore the pip depedency resolver errors.)${COLOUR_OFF}"
	@echo "----------------------------------------------------------------------------------------------------------------------"
	@virtualenv -p python3 venv; \
	source venv/bin/activate; \
	pip3 install -r requirements.txt; \
.PHONY: deps

install: get_ips
	@echo "------------------------------------------------------------------"
	@echo "${YELLOW}Target: 'install'. Run the setup and install targets.${COLOUR_OFF}"
	@echo "------------------------------------------------------------------"
.PHONY: install

test:
	@echo "------------------------------------------------------------------"
	@echo "${YELLOW}Target 'test'. Perform any required tests.${COLOUR_OFF}"
	@echo "------------------------------------------------------------------"
.PHONY: test

clean:
	@echo "------------------------------------------------------------------"
	@echo "${YELLOW}Target 'clean'. Remove any redundant files, e.g. downloads.${COLOUR_OFF}"
	@echo "------------------------------------------------------------------"
.PHONY: clean

get_ips:
	@# Target: 'get_ips'. Get input args from config.json
	$(eval ENV=$(shell yq '.general_params.env | select( . != null )' ${CONFIG_FILE}))
	$(eval CURRENT_DIR=$(shell pwd))
.PHONY: get_ips

validate_user_ip: get_ips
	@echo "------------------------------------------------------------------"
	@echo "${YELLOW}Target: 'validate_user_ip'. Validate the user inputs.${COLOUR_OFF}"
	@echo "------------------------------------------------------------------"
	# INFO: Verify the user has provided a value for the key 'ENV' in ip/config.yaml
	@[ "${ENV}" ] || ( echo "\nError: 'ENV' key is empty in ip/config.yaml\n"; exit 1 )
.PHONY: validate_user_ip

# Phony targets
.PHONY = all deps install test clean

# .PHONY tells Make that these targets don't represent files
# This prevents conflicts with any files named "all" or "clean"

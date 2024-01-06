SHELL = /bin/sh

#================================================================
# Usage
#================================================================
# make deps		# just install the dependencies
# make install		# perform the end-to-end install
# make clean		# perform a housekeeping cleanup

#=======================================================================
# Variables
#=======================================================================
.EXPORT_ALL_VARIABLES:

include src/make/variables.mk # load variables from a separate makefile file
include src/make/setup.mk # load makefile setup targets from a separate makefile file

CONFIG_FILE := config.yaml
PIP_INSTALL_CMD=pip3 install -q --disable-pip-version-check
#=======================================================================
# Targets
#=======================================================================
all: deps install clean

deps: get_ips
	@echo "${INFO}\nCalled makefile target 'deps'. Download any required libraries.${COLOUR_OFF}\n"
	@echo "${DEBUG}deps called"
	@${PIP_INSTALL_CMD} -q -r requirements.txt

install: get_ips
	@echo "${INFO}\nCalled makefile target 'install'. Run the setup & install targets.\n${COLOUR_OFF}"

run:
	@echo "${INFO}\nCalled makefile target 'run'. Launch service.${COLOUR_OFF}\n"

test:
	@echo "${INFO}\nCalled makefile target 'test'. Perform any required tests.${COLOUR_OFF}\n"

clean:
	@echo "${INFO}\nCalled makefile target 'clean'. Restoring the repository to its initial state.${COLOUR_OFF}\n"

# Phony targets
.PHONY: all deps install run test clean

# .PHONY tells Make that these targets don't represent files
# This prevents conflicts with any files named "all" or "clean"

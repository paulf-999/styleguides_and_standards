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

# load variables from separate file
include config.mk
#=======================================================================
# Targets
#=======================================================================
all: deps install clean
.PHONY: all

deps:
	@echo "----------------------------------------------------------------------------------------------------------------------"
	@echo "${YELLOW}Target: 'deps'. Download the relevant pip package dependencies (note: ignore the pip depedency resolver errors.)${COLOUR_OFF}"
	@echo "----------------------------------------------------------------------------------------------------------------------"
	@echo "deps called"
.PHONY: deps

install:
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

# Phony targets
.PHONY = all deps install test clean

# .PHONY tells Make that these targets don't represent files
# This prevents conflicts with any files named "all" or "clean"

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

include src/make/variables.mk # load variables from a separate makefile file
#=======================================================================
# Targets
#=======================================================================
all: deps install clean

deps:
	@echo && echo "${INFO}Called makefile target 'deps'. Download any required libraries.${COLOUR_OFF}" && echo
	@echo "deps called"

install:
	@echo && echo "${INFO}Called makefile target 'install'. Run the setup & install targs.${COLOUR_OFF}" && echo

test:
	@echo && echo "${INFO}Called makefile target 'test'. Perform any required tests.${COLOUR_OFF}" && echo

clean:
	@echo && echo "${INFO}Called makefile target 'clean'. Restoring the repository to its initial state.${COLOUR_OFF}" && echo

# Phony targets
.PHONY: all deps install test clean

# .PHONY tells Make that these targets don't represent files
# This prevents conflicts with any files named "all" or "clean"

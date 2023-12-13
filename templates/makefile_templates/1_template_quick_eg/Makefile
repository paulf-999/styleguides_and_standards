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

# ANSI escape codes for color formatting
DEBUG := \033[0;36m # cyan (for debug messages)
INFO := \033[0;32m # green (for informational messages)
WARNING := \033[0;33m # yellow (for warning messages)
ERROR := \033[0;31m # red (for error messages)
CRITICAL := \033[1;31m # bold red (for critical errors)
COLOUR_OFF := \033[0m # reset text color

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

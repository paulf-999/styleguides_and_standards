SHELL = /bin/sh

# all: deps install [X, Y, Z...] clean

.EXPORT_ALL_VARIABLES:

.PHONY = installations deps install clean get_ips

CONFIG_FILE := config.json

$(eval current_dir=$(shell pwd))
$(eval program=$(shell jq '.Parameters.Program' ${CONFIG_FILE`}))

installations: deps install clean

.PHONY: deps
deps:
	$(info [+] Download the relevant dependencies)
	pip install jq -q

.PHONY: install
install:
	$(info [+] Install the relevant dependencies)

.PHONY: clean
clean:
	$(info [+] Remove any redundant files, e.g. downloads)

get_ips:
    @# Target: 'get_ips'. Get input args from config.json
    #$(eval ENV=$(shell jq -r '.GeneralParameters.Env' ${CONFIG_FILE}))
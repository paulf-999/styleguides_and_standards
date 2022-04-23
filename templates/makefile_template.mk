SHELL = /bin/sh

# all: deps install [X, Y, Z...] clean

eg_var ?=
CONFIG_FILE := config/envvars.json

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

SHELL = /bin/sh

# all: deps install [X, Y, Z...] clean

eg_var ?=
config_file := config.json

$(eval current_dir=$(shell pwd))
$(eval program=$(shell jq '.Parameters.Program' ${config_file}))

installations: deps install clean

.PHONY: deps
deps:
	$(info [+] Download the relevant dependencies)

.PHONY: install
install:
	$(info [+] Install the relevant dependencies)

.PHONY: clean
clean:
	$(info [+] Remove any redundant files, e.g. downloads)

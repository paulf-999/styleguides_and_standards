SHELL = /bin/sh

# default: deps install [X, Y, Z...] clean

eg_var ?=
config_file := conf/config.json

$(eval current_dir=$(shell pwd))
$(eval program=$(shell jq '.Parameters.Program' ${config_file}))

installations: deps install clean

deps:
	$(info [+] Download the relevant dependencies)

install:
	$(info [+] Install the relevant dependencies)

clean:
	$(info [+] Remove any redundant files, e.g. downloads)

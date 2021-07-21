SHELL = /bin/sh

# default: deps install [X, Y, Z...] clean

installations: deps install clean

$(eval current_dir=$(shell pwd))

eg_var ?=

deps:
	$(info [+] Download the relevant dependencies)

install:
	$(info [+] Install the relevant dependencies)

clean:
	$(info [+] Remove any redundant files, e.g. downloadsß)

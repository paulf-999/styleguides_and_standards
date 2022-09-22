SHELL = /bin/sh

# all: deps install [X, Y, Z...] clean

.EXPORT_ALL_VARIABLES:

.PHONY = installations deps install clean get_ips

installations: deps install clean

deps:
	$(info [+] Download the relevant dependencies)
	pip3 install pre-commit

install:
	$(info [+] Install the relevant dependencies)
	pre-commit install

clean:
	$(info [+] Remove any redundant files, e.g. downloads)

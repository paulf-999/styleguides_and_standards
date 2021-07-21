SHELL = /bin/sh

example_var = ${CURDIR}/src

all: run

run: link
    # Instructions for run

link: lib
    # Instructions for link

lib: compile
    # Instructions for make the lib

compile:
    # Instructions for compilation

example-new-target:
	# Example new target

SHELL = /bin/sh

# all: deps install [X, Y, Z...] clean

.EXPORT_ALL_VARIABLES:

.PHONY = installations deps install clean

CICD_job_name := name_of_cicd_job_here

installations: deps install clean

deps:
	$(info [+] Download the relevant dependencies)
	brew install gitlab-runner

install:
	$(info [+] Install the relevant dependencies)
	gitlab-runner register
exec_locally:
	gitlab-runner exec shell ${CICD_job_name}

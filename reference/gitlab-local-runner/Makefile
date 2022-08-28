SHELL = /bin/sh

# all: deps install [X, Y, Z...] clean

.EXPORT_ALL_VARIABLES:

.PHONY = installations deps install clean get_ips

GITLAB_PROJECT_NAME := cicd_gitlab_eg

installations: deps install clean

deps:
	$(info [+] Download the relevant dependencies)
	brew install gitlab-runner

install:
	$(info [+] Install the relevant dependencies)
	gitlab-runner register

clean:
	$(info [+] Remove any redundant files, e.g. downloads)

get_ips:
    @# Target: 'get_ips'. Get input args from config.json
    #$(eval ENV=$(shell jq -r '.GeneralParameters.Env' ${CONFIG_FILE}))
	echo "test"

exec_locally:
	gitlab-runner exec shell ${GITLAB_PROJECT_NAME}

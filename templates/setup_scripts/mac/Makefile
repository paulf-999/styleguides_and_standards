

.EXPORT_ALL_VARIABLES:
.PHONY: installations deps clean install get_ips validate_user_ip

CONFIG_FILE := ip/config.yaml
PIP_INSTALL_CMD=pip3 install -q --disable-pip-version-check

# the 2 vars below are just for formatting CLI message output
YELLOW := \033[0;33m
COLOUR_OFF := \033[0m

installations: deps install clean

deps:
	@echo "----------------------------------------------------------------------------------------------------------------------"
	@echo "${YELLOW}Target: 'deps'. Download the relevant pip package dependencies (note: ignore the pip depedency resolver errors.)${COLOUR_OFF}"
	@echo "----------------------------------------------------------------------------------------------------------------------"
	@sh src/sh/mac_packages.sh
	@cd ../../../reference/zsh_and_ohmyzsh && ./install_zsh_and_ohmyzsh.sh
	@sh src/sh/prepend_template_zshrc.sh
	# wip
	@#${PIP_INSTALL_CMD} -q -r requirements.txt

install:
	@echo "------------------------------------------------------------------"
	@echo "${YELLOW}Target: 'install'. Run the setup and install targets.${COLOUR_OFF}"
	@echo "------------------------------------------------------------------"

clean:
	@echo "------------------------------------------------------------------"
	@echo "${YELLOW}Target 'clean'. Remove any redundant files, e.g. downloads.${COLOUR_OFF}"
	@echo "------------------------------------------------------------------"

a:
	sh src/sh/mac_packages.sh

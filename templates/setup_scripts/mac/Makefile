# all: deps install [X, Y, Z...] clean

.EXPORT_ALL_VARIABLES:
.PHONY = installations deps clean install get_ips validate_user_ip

CONFIG_FILE := ip/config.yaml
PIP_INSTALL_CMD=pip3 install -q --disable-pip-version-check

# the 2 vars below are just for formatting CLI message output
COLOUR_TXT_FMT_OPENING := \033[0;33m
COLOUR_TXT_FMT_CLOSING := \033[0m

installations: deps install clean

deps:
	@echo "----------------------------------------------------------------------------------------------------------------------"
	@echo "${COLOUR_TXT_FMT_OPENING}Target: 'deps'. Download the relevant pip package dependencies (note: ignore the pip depedency resolver errors.)${COLOUR_TXT_FMT_CLOSING}"
	@echo "----------------------------------------------------------------------------------------------------------------------"
	@#${PIP_INSTALL_CMD} -q -r requirements.txt
	@cd ../../../reference/zsh_and_ohmyzsh && ./install_zsh_and_ohmyzsh.sh

install:
	@echo "------------------------------------------------------------------"
	@echo "${COLOUR_TXT_FMT_OPENING}Target: 'install'. Run the setup and install targets.${COLOUR_TXT_FMT_CLOSING}"
	@echo "------------------------------------------------------------------"

clean:
	@echo "------------------------------------------------------------------"
	@echo "${COLOUR_TXT_FMT_OPENING}Target 'clean'. Remove any redundant files, e.g. downloads.${COLOUR_TXT_FMT_CLOSING}"
	@echo "------------------------------------------------------------------"

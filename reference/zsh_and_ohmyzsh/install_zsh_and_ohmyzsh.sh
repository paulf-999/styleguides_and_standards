#!/bin/bash
#================================================================
## HEADER
#================================================================
## Overview:    [TODO - add one-line overview]
##
## Description: [TODO - Add a brief description of what the script does]
##
## Usage:       [TODO - ]<SCRIPT NAME> <ARGS>"
##
#================================================================

# for good code readability, let's put the functions in a separate file
source functions_for_ohmyzsh_install.sh

#=======================================================================
# Main script logic
#=======================================================================
echo && echo -e "${PURPLE}# Script execution started${COLOUR_OFF}" && echo

# check what OS is being used
if [[ "$OSTYPE" == "linux-gnu"* || "$OSTYPE" == "linux"* ]]; then
    echo -e "${PURPLE}# INFO: You are using a (non-Mac) Unix-like system"

    # If it's a (non-Mac) Linux system, we first need to install zsh

    # Step 1: install zsh
    install_zsh

elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "${PURPLE}# INFO: You are using macOS"

else
    echo -e "${PURPLE}# INFO: Unknown operating system"
    system
fi

# post-the Unix-only requirement for the ZSH install...
# let's continue with the remainder of the installation.

# Step 2: install 'oh My zsh'
install_ohmyzsh

# Step 3. Install ohmyzsh plugins
install_ohmyzsh_plugins

# Step 4. install the 'oh my zsh' plugin, 'powerlevel10k'
install_powerlevel10k

echo && echo -e "${PURPLE}# Script execution finished.${COLOUR_OFF}"

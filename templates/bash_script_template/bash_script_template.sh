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

#=======================================================================
# Variables
#=======================================================================
variable1="value1"
variable2="value2"

# setup colour formatting
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
COLOUR_OFF='\033[0m' # Text Reset

#=======================================================================
# Functions
#=======================================================================
function_name() {
    # Function code goes here
    echo "This is a function"
}

validation_input_args() {
    # function to validate the input args provided
    if [ $# -eq 0 ] ; then
        echo ""
        echo -e "${RED}#############################################################################################"
        echo -e "${RED}# ERROR: Missing an input arg."
        echo -e "${RED}#"
        echo -e "${RED}# Expected a single input argument."
        echo -e "${RED}#"
        echo -e "${RED}# Usage:\t./<SCRIPT NAME> <ARGS>"
        # echo -e "${RED}# Example:\t./validate_git_branch_name.sh feature/change"
        echo -e "${RED}"
        echo -e "${RED}#############################################################################################${COLOUR_OFF}"
        exit 1
    fi
}

#=======================================================================
# Main script logic
#=======================================================================
echo -e "${YELLOW}#############################################################################################"
echo -e "${YELLOW}# INFO: Script execution started."
echo -e "${YELLOW}#############################################################################################${COLOUR_OFF}"

# TODO: add your code here

# Call functions if needed
validation_input_args

echo -e "${YELLOW}#############################################################################################"
echo -e "${YELLOW}# INFO: Script execution completed."
echo -e "${YELLOW}#############################################################################################${COLOUR_OFF}"

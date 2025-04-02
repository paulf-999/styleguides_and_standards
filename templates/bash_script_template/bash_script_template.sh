#!/bin/bash

# Exit immediately if a command exits with a non-zero status (fail fast).
set -e

#=======================================================================
# Variables
#=======================================================================
variable1="value1"
variable2="value2"

# ANSI escape codes for color formatting
DEBUG='\033[0;36m'    # cyan (for debug messages)
INFO='\033[0;32m'     # green (for informational messages)
WARNING='\033[0;33m'  # yellow (for warning messages)
ERROR='\033[0;31m'    # red (for error messages)
CRITICAL='\033[1;31m' # bold red (for critical errors)
COLOUR_OFF='\033[0m'   # reset text color

#=======================================================================
# Functions
#=======================================================================
function_name() {
    # Function code goes here
    echo "This is a function"
}

print_info_message() {
    local message="$1"
    echo && echo -e "${INFO}# $message"
}

# Signal handler to catch interruptions (Ctrl+C)
handle_interruption() {
    print_info_message "Script execution aborted by the user."
    exit 1
}

validation_input_args() {
    # function to validate the input args provided
    if [ $# -eq 0 ] ; then
        echo ""
        echo -e "${ERROR}#############################################################################################"
        echo -e "${ERROR}# ERROR: Missing an input arg."
        echo -e "${ERROR}#"
        echo -e "${ERROR}# Expected a single input argument."
        echo -e "${ERROR}#"
        echo -e "${ERROR}# Usage:\t./<SCRIPT NAME> <ARGS>"
        echo -e "${ERROR}"
        echo -e "${ERROR}#############################################################################################${COLOUR_OFF}"
        exit 1
    fi
}

#=======================================================================
# Main script logic
#=======================================================================
print_info_message "Script execution started."

# Call functions if needed
validation_input_args

# TODO: add your code here

print_info_message "Script execution completed."

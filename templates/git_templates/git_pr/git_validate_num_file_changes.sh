#!/bin/bash
#=======================================================================
# Variables
#=======================================================================
PR_BRANCH=${1}
BASE_BRANCH=master
MAX_FILES_CHANGED=20

# setup colour formatting
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
COLOUR_OFF='\033[0m' # Text Reset

#=======================================================================
# Main script logic
#=======================================================================
echo -e "${YELLOW}#############################################################################################"
echo -e "${YELLOW}# INFO: Script execution started."
echo -e "${YELLOW}#############################################################################################${COLOUR_OFF}"

# fetch the latest changes (and remote branches)
git checkout -q ${BASE_BRANCH} && git pull

# we'll need to run the following commands on the PR branch
git checkout -q ${PR_BRANCH}

FILE_COUNT=$(git diff --name-only --diff-filter=d "$BASE_BRANCH".."$PR_BRANCH" | sort -u | wc -l)

if [ "${FILE_COUNT}" -gt ${MAX_FILES_CHANGED} ]; then
    echo && echo "${RED}#--------------------------------------------------------------------------------------------"
    echo "${RED}# Error: Too many files (${FILE_COUNT}) changed in the Git PR (Pull Request)."
    echo "${RED}#--------------------------------------------------------------------------------------------" && echo
    exit 1
else
    echo "Number of files changed: ${FILE_COUNT}"
fi

echo -e "${YELLOW}#############################################################################################"
echo -e "${YELLOW}# INFO: Script execution completed."
echo -e "${YELLOW}#############################################################################################${COLOUR_OFF}"

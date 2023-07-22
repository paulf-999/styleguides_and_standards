#!/bin/bash
#=======================================================================
# Variables
#=======================================================================
# setup colour formatting
RED='\033[0;31m'
YELLOW='\033[0;33m'
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
COLOUR_OFF='\033[0m' # Text Reset

#=======================================================================
# Main script logic
#=======================================================================
echo && echo -e "${PURPLE}# Script execution started${COLOUR_OFF}"

wait
echo && echo -e "${YELLOW}# Step 1: Install zsh${COLOUR_OFF}" && echo
#-----------------------------------
# Step 1. Install zsh
#-----------------------------------
sudo apt install -yqq zsh zsh-common zsh-doc zsh zsh-common

#-----------------------------------
# Step 2. install 'Oh My Zsh'
#-----------------------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null 2>&1 &
wait
echo && echo -e "${YELLOW}# Step 2. Install 'Oh My Zsh'"

#-----------------------------------
# Step 3. Install ohmyzsh plugins
#-----------------------------------
echo -e "${YELLOW}# Step 3: Install the 'Oh My Zsh' plugins${COLOUR_OFF}"
# syntax highlighting
git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# code completions
git clone -q https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
# auto-suggestions
git clone -q https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wait
# Add the names of the cloned repositories to the plugin list.
sed -i "s/plugins=(git)/plugins=(\n git\n zsh-syntax-highlighting\n zsh-autosuggestions\n zsh-completions\n)\n# command for zsh-completions\nautoload -U compinit \&\& compinit/" ~/.zshrc

#-------------------------------------------------------------
# Step 4. install the 'oh my zsh' plugin, 'powerlevel10k'
#-------------------------------------------------------------
# Download Powerlevel10k
echo -e "${YELLOW}# Step 4: Download the 'Oh My Zsh' theme, Powerlevel10k${COLOUR_OFF}"
git clone -q --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

# Set ZSH_THEME to Powerlevel10k in .zshrc
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

echo && echo -e "${PURPLE}# Script execution completed." && echo

# Load Powerlevel10k in the current shell
exec zsh -c '. ~/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme'

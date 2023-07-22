#!/bin/bash
#=======================================================================
# Variables
#=======================================================================
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

install_zsh() {
    # Install zsh
    echo && echo -e "${YELLOW}# Step 1: Install zsh${COLOUR_OFF}" && echo
    sudo apt install -yqq zsh zsh-common zsh-doc zsh zsh-common
}

install_ohmyzsh() {
    # Install 'Oh My Zsh'
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null 2>&1 &
    wait
    echo && echo -e "${YELLOW}# Step 2. Install 'Oh My Zsh'"
}

install_ohmyzsh_plugins() {
    # Install ohmyzsh plugins
    echo -e "${YELLOW}# Step 3: Install the 'Oh My Zsh' plugins${COLOUR_OFF}"
    # syntax highlighting
    git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # code completions
    git clone -q https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
    # auto-suggestions
    git clone -q https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    wait

    # unix version
    # sed -i "s/plugins=(git)/plugins=(\n git\n zsh-syntax-highlighting\n zsh-autosuggestions\n zsh-completions\n)\n# command for zsh-completions\nautoload -U compinit \&\& compinit/" ~/.zshrc

    # mac version
    sed -i '' "s/plugins=(git)/plugins=(\n git\n zsh-syntax-highlighting\n zsh-autosuggestions\n zsh-completions\n)\n# command for zsh-completions\nautoload -U compinit \&\& compinit/" ~/.zshrc

}

install_powerlevel10k() {
    #-------------------------------------------------------------
    # Step 4. install the 'oh my zsh' plugin, 'powerlevel10k'
    #-------------------------------------------------------------
    # Download Powerlevel10k
    echo -e "${YELLOW}# Step 4: Download the 'Oh My Zsh' theme, Powerlevel10k${COLOUR_OFF}"
    git clone -q --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

    # Set ZSH_THEME to Powerlevel10k in .zshrc
    # unix version
    # sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

    # mac version
    sed -i '' 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

    echo && echo -e "${PURPLE}# Script execution completed." && echo

    # Load Powerlevel10k in the current shell
    exec zsh -c '. ~/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme'
}

#!/bin/bash
####################################
# 1. install zsh
####################################
sudo apt install -yqq zsh zsh-common zsh-doc zsh zsh-common
####################################
# 2. install 'Oh My Zsh'
####################################
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# After the installation script completes, it will prompt you to set Zsh as your default shell. Enter 'Y' to confirm the change.
# Close and reopen your terminal for the changes to take effect.
####################################
# the instruction below shouldn't be required, but I'll leave it in just in case it's needed.
# set Zsh as the default shell for your user. Command: chsh -s $(which zsh)
####################################
# 3. Install ohmyzsh plugins
####################################
# 3.1. syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# code completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
# auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
####################################
# Add the names of the cloned repositories to the plugin list.
####################################
sed -i "s/plugins=(git)/plugins=(\n git\n zsh-syntax-highlighting\n zsh-autosuggestions\n zsh-completions\n)\n# command for zsh-completions\nautoload -U compinit \&\& compinit/" ~/.zshrc

######################################################
# 2. install the 'oh my zsh' plugin, 'powerlevel10k'
######################################################
# Download Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k

# Set ZSH_THEME to Powerlevel10k in .zshrc
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Load Powerlevel10k in the current shell
. ~/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

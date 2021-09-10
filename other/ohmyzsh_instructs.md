# Other installs

ohmyzsh:
1. Download & install
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
2. Download and install the ohmyzsh theme 'powerlevel10k': https://github.com/romkatv/powerlevel10k

2.1. Download the following fonts: https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
2.2. Then configure VSCode / terminal to use these fonts. E.g.:

Visual Studio Code:
`Open File → Preferences → Settings, enter terminal.integrated.fontFamily in the search box and set the value to MesloLGS NF.`

2.3. Install the Powerlevel10k plugin manager (using homebrew):

```
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
```

and Bob's your uncle! A configuration wizard then appears in the terminal

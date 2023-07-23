#--------------------------------------------------------------------
# Template .zshrc args below
#--------------------------------------------------------------------
# Add directories to your PATH variable
#----------------------------------------
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

#----------------------------------------
# Custom environment variables
#----------------------------------------
export MY_VARIABLE="hello"

#----------------------------------------
# Aliases
#----------------------------------------
alias pip=pip3
alias ll='ls -alF'
alias grep='grep --color=auto'
alias reload='source ~/.zshrc'

#----------------------------------------
# Other
#----------------------------------------
# Set the default editor (change to your preferred editor)
export EDITOR="vi"
# Enable color support in the terminal
autoload -U colors && colors
# Enable history expansion with '!' at the beginning
setopt hist_expand
# Enable case-insensitive completion
setopt nocaseglob
#--------------------------------------------------------------------
# Add any other custom configurations or plugins below this line
#--------------------------------------------------------------------

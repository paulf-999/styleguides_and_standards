# Set the default editor (change to your preferred editor)
export EDITOR="nano"

# Enable color support in the terminal
autoload -U colors && colors

# Add useful aliases
alias ll='ls -alF'
alias grep='grep --color=auto'
alias reload='source ~/.zshrc'

# Add directories to your PATH variable
export PATH="/usr/local/bin:$PATH"

# Enable history expansion with '!' at the beginning
setopt hist_expand

# Enable case-insensitive completion
setopt nocaseglob
autoload -U compinit && compinit

# Enable zsh-syntax-highlighting plugin
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable zsh-autosuggestions plugin
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable command auto-completion
autoload -U compinit && compinit

# Set custom environment variables
export MY_VARIABLE="hello"

# Add any other custom configurations or plugins below this line

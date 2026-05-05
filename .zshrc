eval "$(starship init zsh)"

alias lg='lazygit'
alias ld='lazydocker'
alias lq='lazysql'

# Git completion (usually already present)
autoload -Uz compinit
compinit

# Autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting (must be last)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

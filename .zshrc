eval "$(starship init zsh)"

export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:$PATH"

alias lg='lazygit'
alias ld='lazydocker'

# Git completion (usually already present)
autoload -Uz compinit
compinit

# Autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting (must be last)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# dotnet
export DOTNET_ROOT="$HOME/.dotnet"                                                                                                                                                         
export PATH="$PATH:$HOME/.dotnet"

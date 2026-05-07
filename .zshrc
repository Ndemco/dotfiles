# Hook Starship into zsh to render the prompt before each command
eval "$(starship init zsh)"

# Tmuxinator sessions for development
dev() {
  local session
  session=$(basename "$PWD")
  case "$1" in
    -laptop) tmuxinator start dev-laptop --name "$session" ;;
    *)       tmuxinator start dev-ultra  --name "$session" ;;
  esac
}

# Aliases
alias lg='lazygit'
alias ld='lazydocker'
alias lq='lazysql'

# Git completion
autoload -Uz compinit
compinit

BREW_PREFIX="$(brew --prefix)"

# Autosuggestions
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Node via fnm — auto-switches when entering a dir with .nvmrc / .node-version
eval "$(fnm env --use-on-cd)"

# For environment variables you don't want commited to git
[ -f "$HOME/.zsh_secrets" ] && source "$HOME/.zsh_secrets"

# Syntax highlighting (must be last)
source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
export PATH="$HOME/.local/bin:$PATH"

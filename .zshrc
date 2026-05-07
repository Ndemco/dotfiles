# Hook Starship into zsh to render the prompt before each command
eval "$(starship init zsh)"

dev() {
  local session
  session=$(basename "$PWD")
  case "$1" in
    -laptop) tmuxinator start dev-laptop --name "$session" ;;
    *)       tmuxinator start dev-ultra  --name "$session" ;;
  esac
}
alias lg='lazygit'
alias ld='lazydocker'
alias lq='lazysql'

# Git completion (usually already present)
autoload -Uz compinit
compinit

BREW_PREFIX="$(brew --prefix)"

# Autosuggestions
source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Lazy-load nvm: stub functions replace themselves with real nvm on first use,
# avoiding the ~300ms startup cost of sourcing nvm on every shell open.
export NVM_DIR="$HOME/.nvm"
_nvm_load() {
  unset -f nvm node npm npx
  [ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && source "$BREW_PREFIX/opt/nvm/nvm.sh"
}
nvm() { _nvm_load; nvm "$@"; }
node() { _nvm_load; node "$@"; }
npm() { _nvm_load; npm "$@"; }
npx() { _nvm_load; npx "$@"; }

# Syntax highlighting (must be last)
source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
export PATH="$HOME/.local/bin:$PATH"
[ -f "$HOME/.secrets" ] && source "$HOME/.secrets"

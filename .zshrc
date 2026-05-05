eval "$(starship init zsh)"

dev() {
  case "$1" in
    -laptop) tmuxinator start dev ;;
    *)       tmuxinator start dev-ultra ;;
  esac
}
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

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
export PATH="$HOME/.local/bin:$PATH"
export GITLAB_API_TOKEN=REDACTED

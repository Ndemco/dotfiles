#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- sudo ---
echo "Enter your password to authorize installs that require sudo:"
sudo -v
while true; do sudo -n true; sleep 60; done 2>/dev/null &
SUDO_PID=$!
trap "kill $SUDO_PID" EXIT

# --- Homebrew ---
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "[skip] Homebrew already installed"
fi

# --- Packages ---
echo "Installing packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile" || echo "[warn] Some packages failed to install, continuing..."

# --- Symlinks ---
link() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "[skip] $dst"
    return
  fi
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "[backup] $dst → $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sf "$src" "$dst"
  echo "[linked] $dst"
}

link "$DOTFILES_DIR/.zshrc"                   "$HOME/.zshrc"
link "$DOTFILES_DIR/starship.toml"            "$HOME/.config/starship.toml"
link "$DOTFILES_DIR/kitty/kitty.conf"         "$HOME/.config/kitty/kitty.conf"
link "$DOTFILES_DIR/kitty/current-theme.conf" "$HOME/.config/kitty/current-theme.conf"
link "$DOTFILES_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
link "$DOTFILES_DIR/hammerspoon/init.lua"     "$HOME/.hammerspoon/init.lua"
link "$DOTFILES_DIR/neovim"                   "$HOME/.config/nvim"

# --- macOS defaults ---
echo "Applying macOS settings..."
bash "$DOTFILES_DIR/macos.sh"

echo ""
echo "Done! Restart your terminal to apply shell changes."

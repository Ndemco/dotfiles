# dotfiles

macOS dev environment setup. Clone this repo and run `install.sh` on a new machine to fully configure the environment.

## What's included

- **Zsh** — shell config with autosuggestions, syntax highlighting, and aliases
- **Starship** — shell prompt
- **Kitty** — terminal emulator config and Catppuccin Mocha theme
- **Neovim** — full IDE setup with LSP, autocompletion, and plugins (see [neovim/README.md](neovim/README.md))
- **Karabiner-Elements** — keyboard remapping (Cmd+Shift+H/L for tab switching in Firefox)
- **Hammerspoon** — global app launch hotkeys
- **macOS defaults** — key repeat rate settings

## Setup

```bash
git clone https://github.com/Ndemco/dotfiles.git ~/repos/dotfiles
bash ~/repos/dotfiles/install.sh
```

The script is idempotent — safe to re-run at any time.

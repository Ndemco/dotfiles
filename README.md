# dotfiles

macOS dev environment setup. Clone this repo and run `install.sh` on a new machine to fully configure the environment.

## What's included

- **Zsh** — shell config with autosuggestions, syntax highlighting, and aliases
- **Starship** — shell prompt
- **Kitty** — terminal emulator config and Catppuccin Mocha theme
- **Neovim** — full IDE setup with LSP, autocompletion, and plugins (see [neovim/README.md](neovim/README.md))
- **Karabiner-Elements** — keyboard remapping (Cmd+Shift+H/L for tab switching in Firefox and Chrome)
- **tmux** — terminal multiplexer with mouse support enabled
- **Hammerspoon** — global app launch hotkeys
- **macOS defaults** — key repeat rate settings (log out and back in for these to take effect)

## Setup

```bash
git clone https://github.com/Ndemco/dotfiles.git ~/repos/dotfiles
bash ~/repos/dotfiles/install.sh
```

The script is idempotent — safe to re-run at any time. It installs Homebrew and all packages via `Brewfile`, then symlinks each config file from this repo to the location the app expects it. If a file already exists at a destination it is backed up as `.bak` before being replaced.

---

## ⚠️ IMPORTANT: Machine-specific secrets

> **Do not put API tokens, client credentials, or machine-specific config in `.zshrc`.**
> Instead, put them in `~/.zsh_secrets` — this file is gitignored and never committed to this repo.

Put API tokens, client credentials, work-specific config, or anything you don't want synced across machines here:

```bash
# ~/.zsh_secrets
export SOME_CLIENT_API_KEY="..."
export SOME_MACHINE_SPECIFIC_CONFIG="..."
```

`.zshrc` loads this file automatically on shell startup. If it doesn't exist, nothing breaks — but your tokens won't be set.

---

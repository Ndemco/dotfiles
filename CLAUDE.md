# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

Dotfiles repository for macOS dev environment setup. Cloning this repo and running `install.sh` on a new machine should fully configure the environment.

## Running the install script

```bash
bash install.sh
```

The script is idempotent — safe to re-run. It will:
1. Prompt for sudo password upfront (needed for some cask installs)
2. Install Homebrew if missing
3. Install all packages via `brew bundle`
4. Symlink each config file to its expected system location
5. Apply macOS system defaults via `macos.sh`

## How symlinks work

Config files live in this repo and are symlinked to where each app expects them. If a real file already exists at the destination, it is backed up as `.bak` before being replaced. The symlink targets are:

| File in repo | Symlinked to |
|---|---|
| `.zshrc` | `~/.zshrc` |
| `starship.toml` | `~/.config/starship.toml` |
| `kitty/kitty.conf` | `~/.config/kitty/kitty.conf` |
| `kitty/current-theme.conf` | `~/.config/kitty/current-theme.conf` |
| `karabiner/karabiner.json` | `~/.config/karabiner/karabiner.json` |
| `hammerspoon/init.lua` | `~/.hammerspoon/init.lua` |

## Adding new configs

1. Copy the config file into the repo (create a subdirectory if needed)
2. Add a `link` call in `install.sh`
3. Add the app to `Brewfile` if it needs to be installed

## macOS system settings

`macos.sh` contains `defaults write` commands for system-level preferences. Currently sets key repeat rate and initial repeat delay.

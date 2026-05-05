# Neovim Config

## Plugin Overview

### Theme — catppuccin/nvim
Sets the colorscheme to Catppuccin Mocha, matching the Kitty terminal theme. Loads automatically on startup.

---

### Status Line — lualine.nvim
Replaces the default bottom bar with a cleaner status line showing mode, file name, git branch, diagnostics, and cursor position. Works automatically, no interaction needed.

---

### File Explorer — neo-tree.nvim
A sidebar showing your project's directory tree.

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle the explorer open/closed |
| `a` | Create a new file (while explorer is focused) |
| `d` | Delete file |
| `r` | Rename file |
| `Enter` | Open file |

Dotfiles are visible by default.

---

### Keybinding Hints — which-key.nvim
When you press `<leader>` (Space) and pause, a popup appears showing all available keybindings for that prefix. Useful for discovering what's available without memorizing everything.

---

### Fuzzy Finder — telescope.nvim
A popup for searching files, text, and buffers across your project.

| Key | Action |
|-----|--------|
| `<leader>ff` | Search files by name |
| `<leader>fg` | Search file contents (live grep) |
| `<leader>fb` | Switch between open buffers |
| `<leader>fh` | Search Neovim help docs |

While the telescope popup is open:
- Type to filter results
- `<CR>` to open the selected item
- `<C-c>` or `Esc` to close

---

### Syntax Highlighting — nvim-treesitter
Provides richer, more accurate syntax highlighting than Neovim's built-in regex-based approach. Works automatically for JavaScript, TypeScript, TSX, HTML, CSS, JSON, Lua, Markdown, and Bash. Additional languages are auto-installed when you open a file of that type.

---

### LSP — nvim-lspconfig + mason.nvim
Mason auto-installs language servers. On first launch it will install `ts_ls` (TypeScript/JavaScript) and `eslint`. Once installed, LSP features are available in any JS/TS file.

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Show all references |
| `K` | Show hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Show code actions |
| `<leader>d` | Show diagnostics for current line |

Diagnostics (errors, warnings) appear inline as you type.

To install additional language servers, run `:Mason` and browse the list.

---

### Autocompletion — nvim-cmp + LuaSnip
Provides an autocomplete popup as you type, sourced from the LSP, open buffers, file paths, and snippets.

| Key | Action |
|-----|--------|
| `<C-Space>` | Manually trigger completion |
| `<Tab>` | Select next item / expand snippet |
| `<S-Tab>` | Select previous item |
| `<CR>` | Confirm selected completion |

Snippets come from `friendly-snippets`, which includes common snippets for JS, TS, HTML, and many other languages out of the box.

---

### Git — gitsigns.nvim
Shows git changes in the sign column (the narrow column to the left of line numbers). Added lines show `▎`, modified lines show `▎`, and deleted lines show ``.

| Key | Action |
|-----|--------|
| `]h` | Jump to next changed hunk |
| `[h` | Jump to previous changed hunk |
| `<leader>hs` | Stage hunk under cursor |
| `<leader>hr` | Reset hunk under cursor |
| `<leader>hp` | Preview hunk diff |
| `<leader>hb` | Show git blame for current line |

---

### Formatting — conform.nvim
Automatically formats your file with Prettier on save for JavaScript, TypeScript, TSX, JSON, HTML, CSS, and Markdown.

Prettier must be available in your project (via `node_modules/.bin/prettier`) or installed globally. No manual action needed — just save the file.

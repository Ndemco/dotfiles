local nvm_dir = vim.fn.expand("$HOME/.nvm")
local nvm_alias = nvm_dir .. "/alias/default"
if vim.fn.filereadable(nvm_alias) == 1 then
  local version = vim.fn.trim(vim.fn.readfile(nvm_alias)[1])
  local bin_path = nvm_dir .. "/versions/node/" .. version .. "/bin"
  if vim.fn.isdirectory(bin_path) == 1 then
    vim.env.PATH = bin_path .. ":" .. vim.env.PATH
  end
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"
vim.opt.autoread = true

-- Keymaps
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Write file" })
vim.keymap.set("n", "<leader>W", "<cmd>wa<cr>", { desc = "Write all files" })

-- Remove empty unnamed buffers when a real file is opened
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    for _, buf in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
      if buf.name == "" and buf.changed == 0 then
        vim.api.nvim_buf_delete(buf.bufnr, {})
      end
    end
  end,
})

-- Trigger autoread when files change on disk
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})

require("lazy").setup("plugins")

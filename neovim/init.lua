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

require("lazy").setup("plugins")

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

require("config.nerdtree")
vim.g.autoformat = true

local opt = vim.opt

opt.shiftwidth = 4
opt.tabstop = 4

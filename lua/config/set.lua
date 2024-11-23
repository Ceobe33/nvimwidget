-- session
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
--vim.opt.guicursor = ""
-- vim.opt.guifont = "Fira_Code_Font"

vim.opt.number = true
-- Make line numbers default
vim.wo.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = true

vim.opt.smartindent = true

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- vitical scroll, cursor pos over border
vim.opt.scrolloff = 8
-- horizontal scroll, cursor pos over side
vim.opt.sidescrolloff = 15

-- Set file encodings in Lua for Neovim
vim.opt.fileencodings = { "utf-8", "gb2312", "gb18030", "gbk", "ucs-bom", "cp936", "latin1" }

-- Set encoding to utf8
vim.opt.encoding = "utf8"

-- Set fallback encodings for Neovim (fencs is not directly applicable in Lua, but we can set fileencoding)
vim.opt.fileencoding = "utf8"

-- [[ Setting options ]]
-- See `:help vim.o`

-- Enable mouse mode
-- vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
-- vim.o.termguicolors = true

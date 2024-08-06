-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

vim.g.mapleader = " "
-- vim.g.vimspector_enable_mapping = "VISUAL_STUDIO"
-- vim.g.loaded_python3_provider = 0
vim.o.runtimepath = vim.o.runtimepath .. ",./bookmark.vim"
--local opt = { noremap = true, silent = true }

---- @param "n" -> normal mode
map("n", "<leader>pv", vim.cmd.Ex, { desc = "back to vim directory" })
map("n", "<C-c>", "<Esc>")

------------------------------------------------------------
-----                     coding                       -----
------------------------------------------------------------
-- move select line or code up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- let cursor always show middle of the window
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- paste & yank
-- purpose is keep the last yank phrase/sth
map("x", "<leader>p", '"_dP', { desc = "[P]aste from system clipboard" })
-- copy/paste things to system clipboard
map("v", "<leader>yy", '"+y', { desc = "[Y]ank to system clipboard" })
map("n", "<leader>pp", '"+p', { desc = "[P]aste from system clipboard" })
map("v", "<leader>pp", '"+p', { desc = "[P]aste from system clipboard" })

--- project
-- to open other projects
map("n", "<leader>c", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "use for tmux emulator" })
map("n", "<leader>f", function()
    vim.lsp.buf.format()
end, { desc = "[F]ormat current file" })

map("n", "<leader>[", "<cmd>foldopen<CR>", { desc = "unfold code scope" })
map("n", "<leader>]", "<cmd>foldclose<CR>", { desc = "fold code scope" })

------------------------------------------------------------
-----                   window & tab                   -----
------------------------------------------------------------
-- switch window
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
-- close window
map("n", "<C-q>", "<C-w>q")
-- tab btn
local _opts = { silent = true, expr = true }
-- Map("i", "<Tab>", "coc#pum#visible() ? coc#pum#next(1) :CheckBackspace() ? '\\<Tab>' :coc#refresh()", _opts, true)
-- Map("i", "<S-Tab>", "coc#pum#visible() ? coc#pum#prev(1) : '\\<C-h>'", _opts, true)
-- \ coc#pum#visible() ? coc#pum#next(1) :
--       \ CheckBackspace() ? "\<Tab>" :
--       \ coc#refresh()
--inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
------------------------------------------------------------
-----              about tab switch/buffer             -----
------------------------------------------------------------
-- switch prev & next tab
-- cmd :help tab to explor more
--Map("n", "<C-h>", "gT", opt)
--Map("n", "<C-l>", "gt", opt)

--Map("n", "<C-wh>", "<C-w>h", opt)

------------------------------------------------------------
-----              about lazy remap config             -----
------------------------------------------------------------
-- This file is automatically loaded by lazyvim.plugins.config

local Util = require("lazyvim.util")

map("n", "vv", "viw", { desc = "Select current word" })

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
    map("n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
    map("n", "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
    map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
    map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
    map("n", "<A-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
    map("n", "<A-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
    map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
    map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "Redraw / clear hlsearch / diff update" }
)

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
-- Map({ "v", "n", "s" }, "<leader>cr", "<cmd>w<cr><esc>", { desc = "Save file(Code Write)" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

if not Util.has("trouble.nvim") then
    map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
    map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- stylua: ignore start

-- toggle options
-- TODO sometime rhs receive table but expecited string|funciton
-- Map("n", "<leader>uf", require("lazyvim.util").toggle, { desc = "Toggle format on Save" })
map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>ul", function()
    Util.toggle("relativenumber", true)
    Util.toggle("number")
end, { desc = "Toggle Line Numbers" })
-- map("n", "<leader>ud", Util.toggle.diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end,
    { desc = "Toggle Conceal" })

-- lazygit
map("n", "<leader>gg", function() Util.terminal.open({ "lazygit" }, { cwd = Util.root.get(), esc_esc = false }) end,
    { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function() Util.terminal.open({ "lazygit" }, { esc_esc = false }) end, { desc = "Lazygit (cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
    map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- floating terminal
map("n", "<leader>fT", function() Util.terminal.open(nil, { cwd = Util.root.get() }) end,
    { desc = "Terminal (root dir)" })
map("n", "<leader>ft", function() Util.terminal.open(nil, { cwd = vim.fn.expand("%:h") }) end,
    { desc = "Terminal (cwd)" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- tabs
-- map("n", "<leader>bl", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader>bf", "<cmd>buffer", { desc = "Buffer <input_des>(keymaps)" })
map("n", "<leader>bl", "<cmd>buffer #<cr>", { desc = "Buffer last(keymaps)" })
map("n", "<leader>bns", "<cmd>new<cr>", { desc = "Buffer split(keymaps)" })
map("n", "<leader>bnv", "<cmd>vsplit new<cr>", { desc = "Buffer vsplit(keymaps)" })

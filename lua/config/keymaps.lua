-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

function Map(mode, lhs, rhs, opts, isApi)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if isApi then
      vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    else
      vim.keymap.set(mode, lhs, rhs, opts)
    end
  end
end

vim.g.mapleader = " "
-- vim.g.vimspector_enable_mapping = "VISUAL_STUDIO"
vim.g.loaded_python3_provider = 0
vim.o.runtimepath = vim.o.runtimepath .. ",./bookmark.vim"
--local opt = { noremap = true, silent = true }

---- @param "n" -> normal mode
Map("n", "<leader>pv", vim.cmd.Ex, { desc = "back to vim directory" })
Map("n", "<leader>w", vim.cmd.w, { desc = "[W]rite file" })
Map("n", "<C-c>", "<Esc>")

-- Map("n", "<leader>ps", function()
--     vim.cmd("so")
-- end, { desc = '[P]roject [S]ource' })

-- Map("n", "<leader>fm", function()
--     vim.cmd("e ++ff=dos")
-- end, { desc = "[F]ormat ^[M] symbol" })

------------------------------------------------------------
-----                     coding                       -----
------------------------------------------------------------
-- move select line or code up and down
Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")

-- let cursor always show middle of the window
Map("n", "n", "nzzzv")
Map("n", "N", "Nzzzv")

-- paste & yank
-- purpose is keep the last yank phrase/sth
Map("x", "<leader>p", '"_dP', { desc = "[P]aste from system clipboard" })
-- copy/paste things to system clipboard
Map("v", "<leader>yy", '"+y', { desc = "[Y]ank to system clipboard" })
Map("n", "<leader>pp", '"+p', { desc = "[P]aste from system clipboard" })
Map("v", "<leader>pp", '"+p', { desc = "[P]aste from system clipboard" })

--- project
-- to open other projects
Map("n", "<leader>c", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "use for tmux emulator" })
Map("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "[F]ormat current file" })

------------------------------------------------------------
-----                   window & tab                   -----
------------------------------------------------------------
-- switch window
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-l>", "<C-w>l")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
-- close window
Map("n", "<C-q>", "<C-w>q")
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

-- better up/down
Map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
Map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
Map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
Map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
Map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
Map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
Map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
Map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
Map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
Map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
Map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
Map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
Map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
Map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
Map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
Map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
  Map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  Map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  Map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  Map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  Map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  Map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  Map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  Map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
Map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
Map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
Map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
Map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

Map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
Map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
Map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
Map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
Map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
Map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
Map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
Map("i", ",", ",<c-g>u")
Map("i", ".", ".<c-g>u")
Map("i", ";", ";<c-g>u")

-- save file
Map({ "i", "v", "n", "s" }, "<leader>cr", "<cmd>w<cr><esc>", { desc = "Save file(Code Write)" })

-- better indenting
Map("v", "<", "<gv")
Map("v", ">", ">gv")

-- lazy
Map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- new file
Map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

Map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
Map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

if not Util.has("trouble.nvim") then
  Map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
  Map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- stylua: ignore start

-- toggle options
Map("n", "<leader>uf", require("lazyvim.util").toggle, { desc = "Toggle format on Save" })
Map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
Map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
Map("n", "<leader>ul", function()
  Util.toggle("relativenumber", true)
  Util.toggle("number")
end, { desc = "Toggle Line Numbers" })
Map("n", "<leader>ud", Util.toggle.diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
Map("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end,
  { desc = "Toggle Conceal" })

-- lazygit
Map("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false }) end,
  { desc = "Lazygit (root dir)" })
Map("n", "<leader>gG", function() Util.float_term({ "lazygit" }, { esc_esc = false }) end, { desc = "Lazygit (cwd)" })

-- quit
Map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  Map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- floating terminal
Map("n", "<leader>fT", function() Util.float_term(nil, { cwd = Util.get_root() }) end, { desc = "Terminal (root dir)" })
Map("n", "<leader>ft", function() Util.float_term(nil, { cwd = vim.fn.expand("%:h") }) end, { desc = "Terminal (cwd)" })
Map("t", "<C-c>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- windows
Map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
Map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
Map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
Map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
Map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
Map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- tabs
Map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
Map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
Map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
Map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
Map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
Map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

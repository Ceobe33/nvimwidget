-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps hereby

vim.g.mapleader = " "
-- vim.g.vimspector_enable_mapping = "VISUAL_STUDIO"
-- vim.g.loaded_python3_provider = 0

vim.g.python3_host_prog = "/home/aaron/.pyenv/versions/3.10.11/bin/python3"
vim.o.runtimepath = vim.o.runtimepath .. ",./bookmark.vim"
--local opt = { noremap = true, silent = true }

---- @param "n" -> normal mode
Map("n", "<leader>pv", vim.cmd.Ex, { desc = "back to vim directory" })
-- Map("n", "<C-c>", "<Esc>`^")

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
Map("n", "<leader><leader>f", function()
    vim.lsp.buf.format()
end, { desc = "[F]ormat current file" })

Map("n", "<leader>[", "<cmd>foldopen<CR>", { desc = "unfold code scope" })
Map("n", "<leader>]", "<cmd>foldclose<CR>", { desc = "fold code scope" })

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

Map("n", "vv", "viw", { desc = "Select current word" })

-- better up/down
Map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
Map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
Map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
Map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
Map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
Map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

local len = 10
-- Resize window using <ctrl> arrow keys
Map("n", "<C-Up>", "<cmd>resize +" .. len .. "<cr>", { desc = "Increase window height" })
Map("n", "<C-Down>", "<cmd>resize -" .. len .. "<cr>", { desc = "Decrease window height" })
Map("n", "<C-Left>", "<cmd>vertical resize -" .. len .. "<cr>", { desc = "Decrease window width" })
Map("n", "<C-Right>", "<cmd>vertical resize +" .. len .. "<cr>", { desc = "Increase window width" })

-- Move Lines
-- Map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- Map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
Map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
Map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
Map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
Map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
    Map("n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
    Map("n", "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
    Map("n", "<A-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
    Map("n", "<A-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
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
-- Map({ "v", "n", "s" }, "<leader>cr", "<cmd>w<cr><esc>", { desc = "Save file(Code Write)" })

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
-- TODO sometime rhs receive table but expecited string|funciton
-- Map("n", "<leader>uf", require("lazyvim.util").toggle, { desc = "Toggle format on Save" })
Map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
Map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
Map("n", "<leader>ul", function()
    Util.toggle("relativenumber", true)
    Util.toggle("number")
end, { desc = "Toggle Line Numbers" })
-- map("n", "<leader>ud", Util.toggle.diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
Map("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end,
    { desc = "Toggle Conceal" })

-- lazygit
Map("n", "<leader>gg", function() Util.terminal.open({ "lazygit" }, { cwd = Util.root.get(), esc_esc = false }) end,
    { desc = "Lazygit (root dir)" })
Map("n", "<leader>gG", function() Util.terminal.open({ "lazygit" }, { esc_esc = false }) end, { desc = "Lazygit (cwd)" })

-- quit
Map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
    Map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- floating terminal
Map("n", "<leader>fT", function() Util.terminal.open(nil, { cwd = Util.root.get() }) end,
    { desc = "Terminal (root dir)" })
Map("n", "<leader>ft", function() Util.terminal.open(nil, { cwd = vim.fn.expand("%:h") }) end,
    { desc = "Terminal (cwd)" })

-- windows
Map("n", "<leader>ww", "<C-W>p", { desc = "Previous window" })
Map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
Map("n", "<C-W>s", "<C-W>s", { desc = "Split window to below" })
Map("n", "<C-W>v", "<C-W>v", { desc = "Split window to right" })

-- tabs
-- map("n", "<leader>bl", "<cmd>tablast<cr>", { desc = "Last Tab" })
Map("n", "<leader>bf", "<cmd>buffer", { desc = "Buffer <input_des>(keymaps)" })
Map("n", "<leader>bl", "<cmd>buffer #<cr>", { desc = "Buffer last(keymaps)" })
Map("n", "<leader>bns", "<cmd>new<cr>", { desc = "Buffer split(keymaps)" })
Map("n", "<leader>bnv", "<cmd>vsplit new<cr>", { desc = "Buffer vsplit(keymaps)" })


vim.cmd([[
        source ~/.config/nvim/lua/config/keymaps.vim
        ]])

if true then
   return
end
---------------default--------------
-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = LazyVim.safe_keymap_set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  LazyVim.cmp.actions.snippet_stop()
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- location list
map("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

-- quickfix list
map("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
map({ "n", "v" }, "<leader>cf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
LazyVim.format.snacks_toggle():map("<leader>uf")
LazyVim.format.snacks_toggle(true):map("<leader>uF")
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map("<leader>ub")
Snacks.toggle.dim():map("<leader>uD")
Snacks.toggle.animate():map("<leader>ua")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.scroll():map("<leader>uS")
Snacks.toggle.profiler():map("<leader>dpp")
Snacks.toggle.profiler_highlights():map("<leader>dph")

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map("<leader>uh")
end

-- lazygit
if vim.fn.executable("lazygit") == 1 then
  map("n", "<leader>gg", function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
  map("n", "<leader>gG", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
end

map("n", "<leader>gL", function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
map("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
map("n", "<leader>gl", function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, { desc = "Git Log" })
map({ "n", "x" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
map({"n", "x" }, "<leader>gY", function()
  Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
end, { desc = "Git Browse (copy)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", function() vim.treesitter.inspect_tree() vim.api.nvim_input("I") end, { desc = "Inspect Tree" })

-- LazyVim Changelog
map("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

-- floating terminal
map("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
map({"n","t"}, "<c-/>",function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
map({"n","t"}, "<c-_>",function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
Snacks.toggle.zen():map("<leader>uz")

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

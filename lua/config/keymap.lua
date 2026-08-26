vim.g.mapleader = " "
--- vim.g.vimspector_enable_mapping = "VISUAL_STUDIO"
--- vim.g.loaded_python3_provider = 0
vim.o.tabstop = 2 -- A TAB character looks like x spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting
vim.o.clipboard = 'unnamedplus'

vim.o.number = true
vim.o.relativenumber = true
vim.g.coc_default_semantic_highlight_groups = 1

vim.opt.encoding = 'utf-8'

-- 设置 hover 浮动窗口的边框
local orig_hover = vim.lsp.handlers["textDocument/hover"]
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  orig_hover,
  {
    border = "rounded",   -- 可选: "single", "double", "rounded", "shadow", 或自定义数组
    -- max_width = 80,
    -- max_height = 30,
  }
)
  Map({'t', 'i', 'n'}, '<C-p>', '<Esc><C-w>p')
  Map('n', '<A-Up>', ':resize +5<CR>')
  Map({'t', 'i', 'n'}, '<A-h>', '<C-\\><C-n><C-w>h')
-- vim.cmd([[
-- let g:coc_node_path = trim(system('which node'))
-- ]])

-- @param mode string
-- @param lf string keys
-- @param rf string default key
-- @param setting table {silent = true} etc.
function Map(mode, lf, rf, setting)
  if setting == nil then
    setting = {}
  end
	vim.keymap.set(mode, lf, rf, setting)
end

-- ref https://neovim.io/doc/user/terminal/
Map('t', '<Esc>', '<C-\\><C-n>')

--===========-- Clip board --===========--


--===========-- Navigation --===========--
if 1 == vim.fn.has('mac') then
  Map({'t', 'i', 'n'}, '<C-h>', '<Esc><C-w>h')
  Map({'t', 'i', 'n'}, '<C-j>', '<Esc><C-w>j')
  Map({'t', 'i', 'n'}, '<C-k>', '<Esc><C-w>k')
  Map({'t', 'i', 'n'}, '<C-l>', '<Esc><C-w>l')
  Map({'t', 'i', 'n'}, '<C-p>', '<Esc><C-w>p')
else
  Map({'t', 'i', 'n'}, '<A-h>', '<C-\\><C-n><C-w>h')
  Map({'t', 'i', 'n'}, '<A-j>', '<C-\\><C-n><C-w>j')
  Map({'t', 'i', 'n'}, '<A-k>', '<C-\\><C-n><C-w>k')
  Map({'t', 'i', 'n'}, '<A-l>', '<C-\\><C-n><C-w>l')
  Map({'t', 'i', 'n'}, '<A-p>', '<C-\\><C-n><C-w>p')
end
Map('n', '<C-q>', '<C-w>q')

Map('n', '<Esc>', ':noh<CR>', {silent = true, desc = 'clear search highlighting'})
Map('n', '<A-p>', '<C-w>p', {silent = true, desc = 'go to previous(last accessed) window'})

--===========-- window size --===========--
if 1 == vim.fn.has('mac') then
  Map('n', '<C-Up>', ':resize +5<CR>')
  Map('n', '<C-Down>', ':resize -5<CR>')
  Map('n', '<C-Left>', ':vertical resize -5<CR>')
  Map('n', '<C-Right>', ':vertical resize +5<CR>')
else
  Map('n', '<A-Up>', ':resize +5<CR>')
  Map('n', '<A-Down>', ':resize -5<CR>')
  Map('n', '<A-Left>', ':vertical resize -5<CR>')
  Map('n', '<A-Right>', ':vertical resize +5<CR>')
end

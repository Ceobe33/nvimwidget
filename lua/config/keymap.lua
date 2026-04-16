vim.g.mapleader = " "
--- vim.g.vimspector_enable_mapping = "VISUAL_STUDIO"
--- vim.g.loaded_python3_provider = 0
vim.o.tabstop = 2 -- A TAB character looks like x spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting

vim.o.number = true
vim.o.relativenumber = true
vim.g.coc_default_semantic_highlight_groups = 1

vim.opt.encoding = 'utf-8'

vim.g.leetcode_browser = 'chrome'
vim.g.leetcode_solution_filetype = 'cpp'

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
Map({'t', 'i'}, '<A-h>', '<C-\\><C-n><C-w>h')
Map({'t', 'i'}, '<A-j>', '<C-\\><C-n><C-w>j')
Map({'t', 'i'}, '<A-k>', '<C-\\><C-n><C-w>k')
Map({'t', 'i'}, '<A-l>', '<C-\\><C-n><C-w>l')
Map('n', '<A-h>', '<C-w>h')
Map('n', '<A-j>', '<C-w>j')
Map('n', '<A-k>', '<C-w>k')
Map('n', '<A-l>', '<C-w>l')

Map('n', '<Esc>', ':noh<CR>', {silent = true, desc = 'clear search highlighting'})
Map('n', '<A-p>', '<C-w>p', {silent = true, desc = 'go to previous(last accessed) window'})

--===========-- window size --===========--
Map('n', '<A-Up>', ':resize +5<CR>')
Map('n', '<A-Down>', ':resize -5<CR>')
Map('n', '<A-Left>', ':vertical resize -5<CR>')
Map('n', '<A-Right>', ':vertical resize +5<CR>')

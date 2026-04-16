-- require('nerdtree')

vim.g.NERDTreeFileLines = 0
-- see :h NERDTreeChDirMode
vim.g.NERDTreeChDirMode = 2
-- vim.g.NERDTreeShowLinesNumbers = 1

vim.keymap.set('n', '<leader>n', ':NERDTreeToggle<CR>')

vim.cmd([[
  " Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
]])

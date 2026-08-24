---------------------- NERDTree ----------------------
-- require('nerdtree')

vim.g.NERDTreeFileLines = 0
-- see :h NERDTreeChDirMode
vim.g.NERDTreeChDirMode = 2
-- vim.g.NERDTreeShowLinesNumbers = 1

Map('n', '<leader>n', ':NERDTreeToggle<CR>')
Map('n', '<leader>nf', ':NERDTreeFind<CR>')

vim.cmd([[
  " Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
]])

---------------------- UndoTree ----------------------
if vim.fn.has('nvim') == 1 then
  Map("n", "<leader>u", "<cmd>Telescope undo<cr>")
else
  require('undotree').setup({
    float_diff = true, -- set this `true` will disable layout option
    --- @type "left_bottom" | "left_left_bottom"
    layout = "left_bottom", -- {left}_{bottom} {left}_{left_bottom}
    --- @type "left" | "right"
    position = "left",
    window = {
      width = 0.25, -- the `undotree` window width percentage related to the editor
      height = 0.25, -- the `preview`(not floating) window height percentage related to the editor
      border = "rounded", -- float window
    },

    ignore_filetype = {},
    --- @type "compact" | "legacy"
    parser = "compact",

    keymaps = {
      ["move_next"] = "j",
      ["move_prev"] = "k",
      ["move2parent"] = "gj",
      ["move_change_next"] = "J",
      ["move_change_prev"] = "K",
      ["action_enter"] = "<cr>",
      ["enter_diffbuf"] = "p", -- is defined for both undotree and preview buffers, so it works as a toggle
      ["quit"] = "q", -- is defined for both undotree and preview buffers
      ["update_undotree_view"] = "S",
    },
  })
  Map('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

  -- or
  Map('n', '<leader>uo', require('undotree').open, { noremap = true, silent = true })
  Map('n', '<leader>uc', require('undotree').close, { noremap = true, silent = true })
end

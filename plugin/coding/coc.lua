local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
-- Make <CR> to accept selected completion item or notify coc.nvim to format
Map("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <C-]> to jump to definition (including library headers)
Map("n", "<C-]>", "<Plug>(coc-definition)", { silent = true })

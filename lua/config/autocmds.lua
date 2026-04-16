-------------- https://github.com/liuchengxu/vista.vim.git --------------
vim.cmd([[
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
]])

-------------- save current buffer when lose focus --------------
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  pattern = "*",
  command = "silent! w",
})


-------------- when enter session reopen nerdtree if opened --------------
vim.cmd([[
  autocmd VimEnter * NERDTreeFind | wincmd p
  autocmd BufEnter NERD_* setlocal nu rnu
]])
-- vim.cmd([[
-- autocmd StdinReadPre * let s:std_in=1
-- autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeFind | endif
-- ]])
-------------- create dir when it isn't exsit --------------
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    local dir = vim.fn.fnamemodify(file, ":p:h")

    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

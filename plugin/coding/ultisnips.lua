vim.g.UltiSnipsExpandTrigger = '<Tab>'
-- vim.g.UltiSnipsJumpForwardTrigger = '<C-;>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-\'>'

vim.g.UltiSnipsEdit = 'vertical'
vim.g.UltiSnipsSnippetDirectories={"UltiSnips", "after/plugin/snippets"}

if 1 == vim.fn.has('mac') then
  vim.g.python3_host_prog = '$HOME/.pyenv/shims/python3'
elseif 1 == vim.fn.has('termux') then
  vim.g.python3_host_prog = '$HOME/../usr/bin/python3'
end

vim.cmd([[
set completeopt=menuone,noinsert,noselect

"如果补全菜单弹出着（pumvisible() 为真），敲回车就相当于按了 <C-y> 去确认；如果菜单没弹出，回车就是正常换行
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

function! UltiSnipsCompleteChoices(opts) abort
  if mode() ==# 'i'
    call complete(col('.'), a:opts)
  endif
endfunction

function! s:PopAndComplete() abort
  if exists('b:ultisnips_dropdown_queue') && len(b:ultisnips_dropdown_queue) > 0
    let opts = remove(b:ultisnips_dropdown_queue, 0)
    call timer_start(1, {-> UltiSnipsCompleteChoices(opts)})
  endif
endfunction

augroup UltiSnipsDropdown
  autocmd!
  autocmd User UltiSnipsEnterFirstTab call s:PopAndComplete()
augroup END

function! UltiSnipsForwardWithDropdown()
  call UltiSnips#JumpForwards()
  call s:PopAndComplete()
  return ''
endfunction

inoremap <silent> <C-;> <C-r>=UltiSnipsForwardWithDropdown()<CR>
]])

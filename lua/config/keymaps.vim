
"这样复制到 X 主选择区
"let @*=expand('%')
"把 @* 换成 @+ 就是剪贴板。

function! s:CpFileEntryToClipBoardNoLineWin()
let original_path = expand("%:p")
let modified_path = substitute(original_path, '^/mnt/\(\w\)', '\1:', '')
"echo modified_path
"echo original_path
let @+ = modified_path
endfunction
silent! command -nargs=0  CpWinDir :call s:CpFileEntryToClipBoardNoLineWin()

" for career hexo yet
function! g:CopyFileAndDirectory()
let original_path = expand("%:p")
let modified_path = substitute(original_path, '.*/\(.*/.*\).md', '\1', '')

let @+ = modified_path
endfunction
silent! command -nargs=0 CpDirfn call g:CopyFileAndDirectory()

function! g:CpFileEntryToClipBoardNoLine()
let @+ = expand("%:p")
endfunction
silent! command -nargs=0 CpNLN call g:CpFileEntryToClipBoardNoLine()

function! g:CpFileEntryToClipBoard()
let @+ = expand("%:p").'|'.line(".")
endfunction
silent! command -nargs=0 Cp2CB call g:CpFileEntryToClipBoard()


" file header config


"let s:templates = [
"  \ '@Author: {{author}} <{{email}}>',
"  \ '@Date: {{created_date}}',
"  \ '@Last Modified by: {{modifier}} <{{modifier_email}}>',
"  \ '@Last Modified time: {{modified_date}}',
"  \ ]
let g:fileheader_author = 'aaron'
let g:fileheader_delimiter_map = {
   \ 'markdown': { 'begin': '---', 'char': '', 'end': '---' }
   \ }
 let g:fileheader_templates_map = {
   \ 'markdown': [
   \   'author: {{author}}',
   \   'created_date: {{created_date}}',
   \   'modified_date: {{modified_date}}',
   \   'title: this is title',
   \   ],
   \ 'typescript': [
   \ '@Copyright: Tencent Inc. Allrights reserved.',
   \ '@Author: v_yunfeiyin',
   \ '@Date:  {{created_date}}',
   \ '@Last Modified by: {{modifier}}',
   \ '@Last Modified time: {{modified_date}}',
   "\ '@FilePath: \TsProj\Panel\Common\Panel_Common_CurrencyColumn_Item.ts',
   "\ '@Desc: 通用货币栏子元素',
   \ ]
   \ }

"cpp keyword document
function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()
au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>

"switching between source and header file
au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" enable vim builtin match plugin
set nocompatible
filetype plugin on
runtime macros/matchit.vim

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

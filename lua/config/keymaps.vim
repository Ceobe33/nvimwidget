
"这样复制到 X 主选择区
"let @*=expand('%')
"把 @* 换成 @+ 就是剪贴板。

function! g:CpFileEntryToClipBoardNoLineWin()
let original_path = expand("%:p")
let modified_path = substitute(original_path, '^/mnt/\(\w\)', '\1:', '')
"echo modified_path
let @+ = modified_path
endfunction
silent! command -nargs=0 CopyEntry call g:CpFileEntryToClipBoardNoLineWin()

function! g:CpFileEntryToClipBoardNoLine()
let @+ = expand("%:p")
endfunction
silent! command -nargs=0 CopyEntry call g:CpFileEntryToClipBoardNoLine()

function! g:CpFileEntryToClipBoard()
let @+ = expand("%:p").'|'.line(".")
endfunction
silent! command -nargs=0 CopyEntry call g:CpFileEntryToClipBoard()

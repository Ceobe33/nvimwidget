" autocmd BufRead,BufNewFile *.json set filetype=jsonc
" but seem didn't work
autocmd FileType json syntax match Comment +\/\/.\+$+

" ============ basic ============
let g:mapleader = " "
" let g:vimspector_enable_mapping = "VISUAL_STUDIO"

set tabstop=2              " A TAB character looks like 2 spaces
set expandtab              " Pressing the TAB key will insert spaces instead of a TAB character
set softtabstop=2          " Number of spaces inserted instead of a TAB character
set shiftwidth=2           " Number of spaces inserted when indenting
set clipboard=unnamedplus

set number                 " 显示行号
set relativenumber         " 显示相对行号
"let g:coc_default_semantic_highlight_groups = 1

set encoding=utf-8         " 设置编码

" ============ keymapping ============
function! Map(modes, key, command, ...)
    " 获取可选参数（如果提供了第4个参数）
    let l:options = a:0 > 0 ? a:1 : {}
    
    " 检查是否设置 noremap 选项
    let l:nmap = has_key(l:options, 'nmap') && l:options['nmap'] == 1
    
    " 根据 l:noremap 的值选择不同的映射命令
    if !l:nmap
        " 使用 noremap（非递归映射）
        execute 'nnoremap ' . a:key . ' ' . a:command
    else
        " 使用普通 map（递归映射）
        execute 'nmap ' . a:key . ' ' . a:command
    endif
endfunction
"
" cusor
if 1 == has('mac')
  call Map(['n', 'i', 't'], '<C-p>', '<Esc><C-w>p')
  call Map(['n', 'i', 't'], '<C-h>', '<Esc><C-w>h')
  call Map(['n', 'i', 't'], '<C-j>', '<Esc><C-w>j')
  call Map(['n', 'i', 't'], '<C-k>', '<Esc><C-w>k')
  call Map(['n', 'i', 't'], '<C-l>', '<Esc><C-w>l')
else
  call Map(['n', 'i', 't'], '<A-p>', '<C-\\><C-n><C-w>p')
  call Map(['n', 'i', 't'], '<A-h>', '<C-\\><C-n><C-w>h')
  call Map(['n', 'i', 't'], '<A-j>', '<C-\\><C-n><C-w>j')
  call Map(['n', 'i', 't'], '<A-k>', '<C-\\><C-n><C-w>k')
  call Map(['n', 'i', 't'], '<A-l>', '<C-\\><C-n><C-w>l')
endif

" window
if 1 == has('mac')
  call Map(['n'], '<M-Up>', ':resize+5<CR>')
  call Map(['n'], '<M-Down>', ':resize-5<CR>')
  call Map(['n'], '<M-Left>', ':vertical resize-5<CR>')
  call Map(['n'], '<M-Right>', ':vertical resize+5<CR>')
else
  call Map(['n'], '<A-Up>', ':resize+5<CR>')
  call Map(['n'], '<A-Down>', ':resize-5<CR>')
  call Map(['n'], '<A-Left>', ':vertical resize-5<CR>')
  call Map(['n'], '<A-Right>', ':vertical resize+5<CR>')
endif

" autocmd BufRead,BufNewFile *.json set filetype=jsonc
" but seem didn't work
autocmd FileType json syntax match Comment +\/\/.\+$+

"""""""""""""clangd"""""""""""""""
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")


""""""""""""" built-in plugins """""""""""""""

"" matchit
set nocompatible
filetype plugin on
runtime macros/matchit.vim

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note: Most plugin managers will do this automatically!
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
" Note: Most plugin managers will do this automatically!
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'
" let g:vimtex_latexmk_enabled = false

" Or with a generic interface:
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

" install vim-plug automatically
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim//autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

" List your plugins here
Plug 'morhetz/gruvbox'

call plug#end()

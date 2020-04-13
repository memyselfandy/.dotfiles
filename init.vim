"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'lervag/vimtex'
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
Plug 'vifm/vifm.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Handling
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile
set nobackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor
"""""""""""""""""""""""""""""""""""""""""""""""""""""

set number
set colorcolumn=80
set cursorcolumn
set cursorline
set wildmenu
syntax enable
set encoding=utf-8
let mapleader = ','
set title
color dracula

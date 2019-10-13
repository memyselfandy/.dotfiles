" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
call plug#end()

set number
set colorcolumn=80,100
set cursorcolumn
set cursorline
set wildmenu
syntax enable
set encoding=utf-8
set noswapfile
let mapleader = ','
set title
color dracula

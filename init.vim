"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
Plug 'vifm/vifm.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Raimondi/delimitMate'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'ncm2/ncm2'                             
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"


" Tabs & Navigation
map <leader>tn :tabnew<cr>      " To create a new tab.
map <leader>to :tabonly<cr>     " To close all other tabs (show only the current tab).
map <leader>tc :tabclose<cr>    " To close the current tab.
map <leader>tm :tabmove<cr>     " To move the current tab to next position.
map <leader>nt :tabn<cr>        " To swtich to next tab.
map <leader>tp :tabp<cr>        " To switch to previous tab.


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree

map <leader>nt :NERDTreeToggle<CR>

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusLine = ''

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabFree()) | q | endif

" NCM2
"autocmd BufEnter * call ncm2#enable_for_buffer()    " To enable ncm2 for all buffers.
"set completeopt=noinsert,menuone,noselect           " :help Ncm2PopupOpen for more
                                                    " information.


" NVIM-R

let R_assign = 0    " disable: `_` replacement by `<-`


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" General
set wildmenu
set encoding=utf-8
set title
set mouse=nicr

" Files & Backup
set nobackup                     " Turn off backup.
set nowb                         " Don't backup before overwriting a file.
set noswapfile                   " Don't create a swap file.
set ffs=unix,dos,mac             " Use Unix as the standard file type.

" Line Numbers & Indentation
set backspace=indent,eol,start  " To make backscape work in all conditions.
set ma                          " To set mark a at current cursor location.
set expandtab                   " To enter spaces when tab is pressed.
set smarttab                    " To use smart tabs.
set autoindent                  " To copy indentation from current line 
                                " when starting a new line.
set si                          " To switch on smart indentation.
set number

" Colors and Fonts 
set colorcolumn=80
set cursorcolumn
set cursorline
syntax enable
color dracula

" Brackets
set showmatch                   " To show matching brackets when text indicator 
                                " is over them.
set mat=2                       " How many tenths of a second to blink 
                                " when matching brackets.

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow

tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

function! OpenTerminal()
  split term://bash
  resize 10
endfunction

nnoremap <c-n> :call OpenTerminal()<CR>
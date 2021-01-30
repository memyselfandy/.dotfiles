"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'arcticicestudio/nord-vim'
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
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

At first I too didn't understand what needs to be done to get this nice looking toolbar. Yes I know about the README and other stuff, but I think there should be a getting started or minimum settings section in the help file.

Anyway here are the settings.

Installing the appropriate fonts
You need to install fonts into your system with symbols like branching, big triangles etc. They are not standard symbols so you need to install a patched font. You can find a lot of patched fonts here: https://github.com/powerline/fonts.

.vimrc settings
From :help airline-customization, place this code into your .vimrc file:

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

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
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" NCM2
"autocmd BufEnter * call ncm2#enable_for_buffer()    " To enable ncm2 for all buffers.
"set completeopt=noinsert,menuone,noselect           " :help Ncm2PopupOpen for more
                                                    " information.


" NVIM-R

let R_assign = 0    " disable: `_` replacement by `<-`

" FZF
nnoremap <C-p> :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
\}

"COC
let g:coc_global_extensions = ['coc-emmet','coc-css','coc-html','coc-json','coc-prettier','coc-tsserver']



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""

" General
set wildmenu
set encoding=utf8
set title
set mouse=nicr
set t_Co=256
let base16colorspace=256
set ruler
set ttyfast
set enc=utf-8

" Files & Backup
set nobackup                     " Turn off backup.
set nowb                         " Don't backup before overwriting a file.
set noswapfile                   " Don't create a swap file.
set ffs=unix,dos,mac             " Use Unix as the standard file type.

" Line Numbers & Indentation
set backspace=indent,eol,start  " To make backscape work in all conditions.
set ma                          " To set mark a at current cursor location.
set tabstop=2
set shiftwidth=2
set expandtab                   " To enter spaces when tab is pressed.
set si                          " To switch on smart indentation.
set number

" Colors and Fonts 
set colorcolumn=80
set cursorcolumn
set cursorline
syntax enable
colorscheme nord

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
  split term://zsh
  resize 15
endfunction

nnoremap <c-n> :call OpenTerminal()<CR>

" Use alt+hjkl to move between split/vsplit
tnoremap <A-h> <C-\><C-n><C-w>w
tnoremap <A-j> <C-\><C-n><C-j>w
tnoremap <A-k> <C-\><C-n><C-k>w
tnoremap <A-l> <C-\><C-n><C-l>w
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" Devicon Settings
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1

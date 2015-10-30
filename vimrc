" Base settings.
set encoding=utf8
set shell=/bin/bash
set nocompatible
filetype off

" Initialize and load plugins.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'fakeclip'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'VundleVim/Vundle.vim'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 0
let g:ctrlp_match_window = 'top,order:ttb'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

call vundle#end()
filetype plugin indent on


" Folding Stuffs
set foldmethod=marker

set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4
set tabstop=4

set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set expandtab
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" Cool tab completion stuff.
set wildmenu
set wildmode=list:longest,full

" Epic GUI-like mouse and keyboard integration.
set mouse=a
set selectmode=mouse,key
set keymodel=startsel

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile


" Visual theme and customization.
set laststatus=2
set fillchars+=vert:│
syntax enable
set background=dark
colorscheme solarized


" Use some 'modern' keyboard shortcuts (I should be ashamed of myself).
nnoremap ; :

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>==gi
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>
nnoremap <C-x> :wq<CR>
inoremap <C-x> <Esc>:wq<CR>==gi

" Text and buffer navigation.
nnoremap <silent> <C-end> G
nnoremap <silent> <C-home> gg
nnoremap <CR> :noh<CR><CR>
nnoremap <tab> :tabn<CR>

" Awesome system clipboard integration.
nmap <C-c> <Plug>(fakeclip-y)
vmap <C-c> <Plug>(fakeclip-y)
imap <C-v> <Plug>(fakeclip-insert-p)
nmap <C-v> <Plug>(fakeclip-p)

" Easy and quick undo.
nnoremap <C-z> u
inoremap <C-z> <Esc>u<CR>==gi

" Move lines up and down with Ctrl-up and Ctrl-down
nnoremap <silent> <C-up> :m-2<CR>==
nnoremap <silent> <C-down> :m+<CR>==
inoremap <C-up> <Esc>:m-2<CR>==gi
inoremap <C-down> <Esc>:m+<CR>==gi
vnoremap <C-up> :m-2<CR>gv=gv
vnoremap <C-down> :m'>+<CR>gv=gv


" Base settings
set encoding=utf8
set shell=/bin/bash
set nocompatible
filetype off
filetype plugin indent on


" Misc. sane defaults
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set backspace=indent,eol,start


" Display setting for lines and wrapping
set number          " Show line numbers
set wrap            " Turn on soft wrapping
set linebreak
set nolist
set breakindent     " Line up indentation when soft wrapping

" Show a wrap guide at 120 characters
set colorcolumn=120
highlight ColorColumn ctermbg=darkgray

" Set default indentation settings (These may be overridden by tab detection later)
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set expandtab
set smarttab        " Insert tabs on the start of a line according to shiftwidth, not tabstop

" Auto indenting
set autoindent
set copyindent

" Highlight matching parenthesis
set showmatch

" Highlight the cursor line
set cursorline

" Search settings
set ignorecase      " Ignore case when searching
set smartcase       " Ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch        " Highlight search terms
set incsearch       " Show search matches as you type

" Cool command completion stuff
set wildmenu
set wildmode=list:longest,full

" Epic GUI-like mouse and keyboard integration.
set mouse=a
set selectmode=mouse,key
set keymodel=startsel

" Dealing with files
set nobackup
set noswapfile
autocmd BufWritePre * :%s/\s\+$//e

" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Turn on automatic spell checking
set spell spelllang=en_us


" Visual interface customization
set hidden
set laststatus=2
set fillchars+=vert:│
syntax enable
set background=dark
nnoremap <C-p> :Unite -start-insert file buffer<CR>

" File tree browser
autocmd FileType vimfiler
    \ nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_smart_l)
autocmd FileType vimfiler setlocal nonumber
autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') |
    \ q | endif


" Use some 'modern' keyboard shortcuts (I should be ashamed of myself)
nnoremap ; :
" List key bindings in case I forget
nnoremap <F1> :map<CR>
nnoremap <F6> :<C-U>MakeshiftBuild<CR>

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>==gi
nnoremap <C-q> :bd<CR>
inoremap <C-q> <Esc>:bd<CR>
nnoremap <F4> :q<CR>
inoremap <F4> <Esc>:q<CR>

" Text and buffer navigation
nnoremap <C-end> G
vnoremap <C-end> G
nnoremap <C-home> gg
vnoremap <C-home> gg
nnoremap <CR> :noh<CR><CR>
nnoremap <silent> <C-Tab> :bnext<CR>
nnoremap <backspace> i<backspace>

" Awesome system clipboard integration
nmap <C-c> <Plug>(fakeclip-y)
vmap <C-c> <Plug>(fakeclip-y)
nmap <C-x> <Plug>(fakeclip-d)
vmap <C-x> <Plug>(fakeclip-d)
nmap <C-v> <Plug>(fakeclip-p)
imap <C-v> <Plug>(fakeclip-insert-p)

" Easy and quick undo
nnoremap <C-z> u
inoremap <C-z> <Esc>u<CR>==gi

" Indentation shortcuts
vnoremap <Tab> >
vnoremap <S-tab> <

" Move lines up and down with Ctrl-up and Ctrl-down
nnoremap <silent> <C-up> :m-2<CR>==
inoremap <C-up> <Esc>:m-2<CR>==gi
vnoremap <C-up> :m-2<CR>gv=gv
nnoremap <silent> <C-down> :m+<CR>==
inoremap <C-down> <Esc>:m+<CR>==gi
vnoremap <C-down> :m'>+<CR>gv=gv


" Syntax highlighting settings
autocmd BufNewFile,BufRead *.json set ft=javascript

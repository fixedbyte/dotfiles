" Author:
" Fixedbyte (Wilmer Quispe)

if !exists('g:vscode')
    let g:mapleader = "\<Space>"
endif

set number relativenumber
set colorcolumn=100
set laststatus=0
set smartindent
set autoindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set showtabline=4
set formatoptions-=cro
set hidden
set nowrap
set encoding=utf-8
set fileencoding=utf-8
set ruler
set mouse=a
set cursorline
set splitbelow
set splitright
set clipboard=unnamedplus
set background=dark
set autochdir
set termguicolors
set nocompatible
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal
set completeopt=noinsert,menuone,noselect
syntax enable
filetype on
filetype indent on
filetype plugin on

call plug#begin()
    " Plugins
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'sheerun/vim-polyglot'
    " Themes
    Plug 'ayu-theme/ayu-vim'
call plug#end()

"
" Themes
"
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" 
" NERDTree
"
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

"
" Vim Airline
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'

" 
" Indent guides
"
let g:indent_guides_enable_on_vim_startup = 1

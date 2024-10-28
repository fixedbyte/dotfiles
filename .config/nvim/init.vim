"
" Author:
" Fixedbyte (Wilmer Quispe)
"
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
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'sheerun/vim-polyglot'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-commentary'
Plug 'oraculo666/vim-m80'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
" Autocompletion
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

if !exists('g:vscode')
    let g:mapleader = "\<Space>"
endif
if has('win64')
    set shell=PowerShell
endif

set number
set relativenumber
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
set nuw=6
set hidden
set nowrap
set textwidth=0
set linebreak
set encoding=utf-8
set fileencoding=utf-8
set ruler
set mouse=a
set cursorline
set splitbelow
set splitright
set clipboard=unnamedplus
" set background=dark
set autochdir
set nocompatible
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal
set completeopt=noinsert,menuone,noselect

"
" Autocommands
"
" Open session and start NERDTree
autocmd VimEnter * NERDTree
" Close NERDTree and rewrite session file
autocmd VimLeave * NERDTreeClose
autocmd VimLeave * mksession! ~/session.vim

"
" Mapkeys
"
" Use ESC to leave search
map <ESC> :noh <CR>

"
" NERDTree
"
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1

"
" Themes
"
set termguicolors     " enable true colors support
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

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
let g:airline_theme='ayu_dark'

" 
" Indent guides
"
let g:indent_guides_enable_on_vim_startup = 1

"
" LSP configuration
"
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    " nmap <buffer> gd <plug>(lsp-definition)
    " nmap <buffer> gs <plug>(lsp-document-symbol-search)
    " nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    " nmap <buffer> gr <plug>(lsp-references)
    " nmap <buffer> gi <plug>(lsp-implementation)
    " nmap <buffer> gt <plug>(lsp-type-definition)
    " nmap <buffer> <leader>rn <plug>(lsp-rename)
    " nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    " nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    " nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"
" Autocompletion
"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

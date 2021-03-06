set mouse=""
set encoding=utf-8

"------------ AUTO SAVE -------------"
augroup autosourcing
  autocmd!
  autocmd! bufwritepost .vimrc source %
augroup END

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autochdir

"Setting Mapping
set list listchars=tab:»·,trail:·

imap jj <Esc>
imap jj <c-c>
vmap v <Esc>

map ; :
let g:mapleader=','

nnoremap <leader><leader> <c-^>

set autowrite
set number

set pastetoggle=<F2>
set clipboard=unnamed

"----------- SEARCH ---------"
nnoremap / /\v
vnoremap / /\v
set hlsearch
map <CR> :nohlsearch<CR>
set incsearch
set ignorecase
set smartcase

"----------- WINDOW MANAGEMENT -----------"
"setting split 
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

"---------- MAPPING ----------"
"NERDT SETTING
nmap ,e :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"----- SETING NUMBER -----"
nmap ,r :set relativenumber<CR>
nmap ,dr :set nornu<CR>

"set cursorline
"set cursorcolumn

set title

filetype plugin on

set undofile
set undodir=~/.config/vim/undodir

"------- INSTALL PLUGIN --------"
call plug#begin('~/.config/vim/plugged')
"Thema Vim
Plug 'morhetz/gruvbox'

"auto Language
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'Luochen1990/rainbow'
Plug 'aaren/arrowkeyrepurpose'
Plug 'EinfachToll/DidyouMean'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'

call plug#end()

"Setting Theme
  set background=dark
  syntax enable
  colorscheme gruvbox
  let g:rainbow_active = 1

"Setting FZM CTRL P
  map <C-P> :Files<CR>
  map <C-G> :GFiles<CR>
  map <C-B> :Buffer<CR>
"Setting ale
  let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

"Setting save sudo
comman! -nargs=0 Sw w !sudo tee % > /dev/null

" Run Code

" Run Python
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Run node/Javascript
nnoremap ,n :!node "%"<CR>

" Commetatar
noremap <leader>/ :Commentary<CR>


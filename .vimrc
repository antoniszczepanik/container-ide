"""PLUGINS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle Requirements
set nocompatible 
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" File finder
Plugin 'ctrlpvim/ctrlp.vim'
" Add file browsing bar
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Pymode 
Plugin 'python-mode/python-mode'
" Blame
Plugin 'zivyangll/git-blame.vim'
" Color
Plugin 'morhetz/gruvbox'
" +- Git sings
Plugin 'airblade/vim-gitgutter'
" Surround :)
Plugin 'tpope/vim-surround'
" Tmux navigation
Plugin 'christoomey/vim-tmux-navigator'
" Repeating plugins commands
Plugin 'tpope/vim-repeat'
  
 " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required 
" Put your non-Plugin stuff after this line

"""COLORS""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set dark background
silent! colorscheme gruvbox 
set t_Co=256
set background=dark
" Less eye-straining colors
hi StatusLine ctermfg=darkgrey
hi StatusLineNC ctermfg=darkgrey
hi VertSplit ctermfg=darkgrey
hi ColorColumn ctermbg=darkgrey
hi Folded ctermbg=darkgrey

"""OTHER""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"""MAKE LIFE EASIER""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=100		           " keep 50 lines of command line history
set incsearch		             " do incremental searching
set ignorecase               " search is case insensitive
set nu rnu                   " set numbers and relative line numbers
set clipboard=unnamedplus    " make system clipboard a default

" move '~' and '.swp' files
" ~/.vim/backup/ dir needs to be created earlier!
set backupdir=~/.vim/backup//,.
set directory=~/.vim/backup//,.

" at least let yourself know what mode you're in
set showmode


syntax enable                " enable syntax highlighting
let python_highlight_all = 1 " enable all Python syntax highlighting features
set showmatch                " show the matching for [], {} and ()
set showcmd		               " display what you are writing as a command
set colorcolumn=80           " show 80th column
set hlsearch                 " highlight string matched in search

"""PLUGIN SETTINGS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pymode
let g:pymode_lint = 0
"git-gutter
set updatetime=75

"""INDENTATION"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent " indent when moving to the next line

autocmd Filetype vim setlocal
  \ expandtab
  \ tabstop=2
  \ shiftwidth=2

autocmd Filetype html setlocal
  \ expandtab
  \ tabstop=2
  \ shiftwidth=2

autocmd Filetype javascript setlocal
  \ expandtab
  \ tabstop=2
  \ shiftwidth=2

autocmd Filetype sh setlocal
  \ expandtab
  \ tabstop=2
  \ shiftwidth=2

autocmd Filetype text setlocal
  \ expandtab
  \ tabstop=2
  \ shiftwidth=2
 	        
autocmd Filetype python setlocal
  \ expandtab
  \ tabstop=4
  \ shiftwidth=4
  \ encoding=utf-8
  \ foldlevel=99
  \ foldmethod=indent

"""MAPPINGS""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Swap ; and :
nnoremap ; :
nnoremap : ;

" Vim-like splits navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Open NERDTree with ,ne
let mapleader = ","
nnoremap <leader>ne :NERDTreeToggle<CR>

" Open CtrlP with ,f
nnoremap <leader>f :CtrlP<CR>

" Check git-blame with ,s
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"""OTHER"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost * GitGutter


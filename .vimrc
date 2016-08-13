set nocompatible              " be iMproved, required
set clipboard=unnamed
set number " line numbers
filetype off                  " required
set tabstop=2
set shiftwidth=2 
set softtabstop=2
set autoindent
set backspace=indent,eol,start "Makes backspare work like normal apps apparently?
"set complete-=i "Does something with autocomplete which don't use so
"commented out, comes from vim sensible defaults (tpope)
set smarttab "Assumably matches tabbing with rest of file?
"set nrformats=-octal "Something about how vim works with numbers, don't are
"atm (tpope - vim sensible)

set ttimeout
set ttimeoutlen=100 "timeout vim will wait for keychain

set incsearch "show matches as they're found when searching

set ruler "shows cursor position?
set wildmenu "enhanced commandline compleition

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2

" Tpope sensible stuff, around the screen position
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
		  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
		  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
  
if v:version > 703 || v:version == 703 && has("patch541")
		  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

set autoread "Automagically read files when they've changed in the fs

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

inoremap <C-U> <C-G>u<C-U>

"""VUNDLE"""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'

"""PLUGINS"""
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}

Plugin 'fatih/vim-go'

Plugin 'tpope/vim-vinegar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nmap <silent> <c-n> :NERDTreeToggle<CR>
syntax on

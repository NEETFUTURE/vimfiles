source $VIMRUNTIME/delmenu.vim 
set langmenu=none 
source $VIMRUNTIME/menu.vim

if has("multi_lang")
language C
endif
set nocompatible

let s:dein_dir = expand('~\.cache\dein')
let s:dein_repo_dir = s:dein_dir . '\repos\github.com\Shougo\dein.vim'
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let g:rc_dir    = expand('~/vimfiles/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" Encoding {{{
set encoding=utf-8
scriptencoding utf-8
" }}}
"
syntax on
set number

" Mapping {{{

" Go to normal-mode
inoremap jj <ESC>
" Clear highlight
nnoremap <ESC><ESC> :noh<CR>
" Exchange : ;
nnoremap ; :

" Emacs-like keybind
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-h> <Backspace>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos() - 2]<CR>
inoremap <C-a> <Home>
inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-h> <Backspace>
inoremap <C-k> <C-o>D
" }}}

" Misc {{{

" buffer
set hidden
" visualbell
set visualbell t_vb=
set noerrorbells

" Appearance
set background=dark
colorscheme solarized
let g:solarized_italic=0
set cursorline
set list
set listchars=tab:>-,trail:.
set number
set numberwidth=5
set showcmd
set showmatch
set wrap
set relativenumber
" lightline
set laststatus=2


" Indent
set autoindent
if exists('&breakindent')
	set breakindent
endif
set noexpandtab
set nosmartindent
set shiftround
set shiftwidth=2
set tabstop=2
"
" Search
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan

" Default directoly
cd ~/

" Clipboard
set clipboard+=unnamed

" }}}


" Disable unused plugins
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1




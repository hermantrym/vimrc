source $VIMRUNTIME/vimrc_example.vim

set nocompatible
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

filetype plugin indent on

syntax on

set clipboard=unnamed
" set ruler

call plug#begin('~/.vim/plugged')
	Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set background=dark

nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

au GUIEnter * simalt ~x

set hls
set is
set cb=unnamed
set gfn=Fixedsys:h10
set ts=4
set sw=4
set si

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [ASCII=\%03.3b\ HEX=\%02.2B]\ [POS=%04l,%04v\ %p%%\ %L]

set guifont=Fira_Mono:h10

set history=1000
set undolevels=1000

set guioptions-=T
set guioptions-=r
set guioptions-=L

set noerrorbells
set novisualbell
set vb t_vb=

set incsearch
set ignorecase
set smartcase

set nofoldenable
set confirm

set mouse=a
set report=0
set nowrap

set number
set relativenumber

set showmatch
set showcmd
set title

set directory=~/.vim/tmp
set wildmenu
set noswapfile
set nobackup
set nowritebackup
set noundofile

set spell spelllang=en_us
set backspace=indent,eol,start

map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

set nu
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set rnu
	autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END


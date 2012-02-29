set autoindent
set wrap
set textwidth=80
set tabstop=4
set shiftwidth=4
set expandtab
set bs=2
set nocp
set indentkeys=
set linebreak
set clipboard=unnamed
set showbreak=\ \ »\ 

map [7~ <Home>
map [8~ <End>
imap [7~ <Home>
imap [8~ <End>

syntax on
color ohess

if exists('+colorcolumn')
  highlight ColorColumn ctermbg=0
  set colorcolumn=80
endif

autocmd FileType make set noexpandtab
autocmd FileType htmldjango,html,xhtml set tabstop=2
autocmd BufEnter,BufNew *.mdwn set syntax=mkd tabstop=2 spell spelllang=en 
autocmd BufEnter,BufNew *.txtl set syntax=textile tabstop=2 spell spelllang=en
autocmd BufEnter,BufNew *.yaml set tabstop=2
autocmd BufEnter,BufNew *.taskpaper set wrap syntax=taskpaper


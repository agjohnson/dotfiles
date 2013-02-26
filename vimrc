call pathogen#runtime_append_all_bundles()
filetype plugin indent on

if has('multi_byte')
    set encoding=utf-8
endif
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
set nu
set laststatus=2

map [7~ <Home>
map [8~ <End>
imap [7~ <Home>
imap [8~ <End>

syntax on
color ohess

let g:Powerline_symbols = 'unicode'
let g:Powerline_dividers_override = [[0x2592], [0x276f], [0x2592], [0x276e]]
let g:Powerline_colorscheme='ohess'

if exists('+colorcolumn')
  highlight ColorColumn ctermbg=0
  set colorcolumn=80
endif

highlight CursorLine term=bold cterm=bold
if exists('+cursorline')
    set cursorline
endif
set list lcs=tab:-·,trail:¶
highlight clear SpellBad
highlight SpellBad ctermbg=0
highlight LineNr ctermfg=0

autocmd FileType make set noexpandtab
autocmd FileType htmldjango,html,xhtml,ruby,puppet set tabstop=2 shiftwidth=2
autocmd FileType html,htmldjango,xhtml set textwidth=0
autocmd BufEnter,BufNew *.mdwn set syntax=mkd tabstop=2 spell spelllang=en
autocmd BufEnter,BufNew *.txtl set syntax=textile tabstop=2 spell spelllang=en
autocmd BufEnter,BufNew *.sls,*.yaml set tabstop=2 shiftwidth=2 syntax=yaml
autocmd BufEnter,BufNew *.taskpaper set wrap syntax=taskpaper
autocmd BufEnter,BufNew Vagrantfile,Capfile set syntax=ruby tabstop=2 shiftwidth=2

let g:syntastic_auto_loc_list=1

let g:pad_dir = '/home/anthony/secure/docs/notes'
let g:pad_default_format = 'textile'

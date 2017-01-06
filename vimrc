set shell=/bin/sh
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
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
set fillchars+=vert:\ 
set nu
set laststatus=2
set t_Co=256
set t_ZH=[3m
set t_ZR=[23m

map [7~ <Home>
map [8~ <End>
imap [7~ <Home>
imap [8~ <End>

syntax on
color ohess

let g:Powerline_symbols = 'unicode'
let g:Powerline_dividers_override = [[0x2592], [0x276f], [0x2592], [0x276e]]
let g:Powerline_colorscheme='ohess'
let g:posero_default_mappings = 1

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
highlight VertSplit ctermbg=1 ctermfg=0

autocmd FileType make set noexpandtab
autocmd FileType htmldjango,html,xhtml,ruby,puppet set tabstop=2 shiftwidth=2
autocmd FileType html,htmldjango,xhtml set textwidth=0
autocmd FileType yaml set tabstop=2 shiftwidth=2 syntax=yaml
autocmd FileType textile set syntax=textile tabstop=2 spell spelllang=en fo+=t
autocmd FileType taskpaper set wrap syntax=taskpaper
autocmd FileType ruby set syntax=ruby tabstop=2 shiftwidth=2
autocmd FileType java set noexpandtab
autocmd FileType perl set fo+=t
autocmd FileType clojure call ClojureOptions()
function ClojureOptions()
    highlight Keyword ctermfg=5
    highlight Define ctermfg=4
    highlight Delimiter ctermfg=3
    "call rainbow_parentheses#activate()
    "RainbowParenthesesLoadRound
endfunction
autocmd FileType rubyfile set syntax=ruby tabstop=2 shiftwidth=2

autocmd BufEnter *.mdwn,*.md set syntax=mkd tabstop=2 spell spelllang=en
autocmd BufEnter *.txtl set syntax=textile tabstop=2 spell spelllang=en
autocmd BufEnter Vagrantfile,Capfile setfiletype rubyfile
autocmd BufEnter *.taskpaper setfiletype taskpaper
autocmd BufEnter *.pde setfiletype arduino
autocmd BufEnter *.ino setfiletype arduino
autocmd BufEnter *.tpl setfiletype xslate

let g:syntastic_python_checkers = ['prospector']
function PythonStrict()
    let g:syntastic_python_prospector_args = '--profile prospector-high'
endfunction
"let g:syntastic_python_prospector_args = '--profile prospector'
let g:syntastic_perl_checkers = ['perlcritic']
let g:syntastic_perl_perlcritic_args = '--harsh'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
map <F7> :SyntasticCheck<CR>

let g:pad_dir = '/home/anthony/secure/docs/notes'
let g:pad_default_format = 'mkd'
let g:pad_window_height = 10
let g:pad_window_width = 85
let g:pad_default_file_extension = '.md'
let g:pad_position = { "list" : "bottom", "pads": "right" }

"let g:flake8_cmd = '/home/anthony/.env/bin/flake8'

let g:pymode_doc = 0
let g:pymode_folding = 0
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_write = 0
let g:pymode_lint_unmodified = 0
let g:python_host_prog = '/Users/anthony/.pyenv/versions/2.7.8/envs/env/bin/python'
let g:python3_host_prog = '/Users/anthony/.pyenv/versions/3.5.1/envs/env-3.5/bin/python3'
set completeopt=menu

map <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.egg$']
let g:NERDTreeChDirMode       = 2
" Clipboard
let g:fakeclip_provide_clipboard_key_mappings = 1

" Ctrlp
let g:ctrlp_custom_ignore = { 'file': '\v\.(pyc|so|swp|tar|tar.gz|tgz)$', 'dir': '\v[\/](\.git|\.hg|env)$' }
let g:ctrlp_working_path_mode = 'rw'

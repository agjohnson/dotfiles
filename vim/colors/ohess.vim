"%% SiSU Vim color file
:set background=dark
:highlight clear
if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif
let colors_name = "ohess"
:hi Normal guifg=White guibg=grey15
:hi Cursor guibg=khaki guifg=slategrey ctermbg=57 ctermfg=254
:hi VertSplit guibg=#c2bfa5 guifg=grey40 gui=none cterm=reverse
:hi Folded guibg=black guifg=grey40 ctermfg=grey ctermbg=darkgrey
:hi FoldColumn guibg=black guifg=grey20 ctermfg=4 ctermbg=7
:hi IncSearch guifg=green guibg=black cterm=none ctermfg=yellow ctermbg=green
:hi ModeMsg guifg=goldenrod cterm=none ctermfg=brown
:hi MoreMsg guifg=SeaGreen ctermfg=darkgreen
:hi NonText guifg=RoyalBlue guibg=grey15 cterm=bold ctermfg=blue
:hi Question guifg=springgreen ctermfg=green
:hi Search guibg=peru guifg=wheat cterm=none ctermfg=grey ctermbg=blue
:hi SpecialKey guifg=yellowgreen ctermfg=darkgreen
:hi StatusLine guibg=#c2bfa5 guifg=black gui=none cterm=bold,reverse
:hi StatusLineNC guibg=#c2bfa5 guifg=grey40 gui=none cterm=reverse
:hi Title guifg=gold gui=bold cterm=bold ctermfg=yellow
:hi Statement guifg=CornflowerBlue cterm=bold ctermfg=125
:hi Visual gui=none guifg=khaki guibg=olivedrab ctermbg=241
:hi WarningMsg guifg=salmon ctermfg=1
:hi String guifg=SkyBlue ctermfg=248
:hi Comment cterm=italic ctermfg=242 guifg=grey40
:hi Constant guifg=#ffa0a0 ctermfg=brown
:hi Special guifg=darkkhaki ctermfg=98
:hi Identifier guifg=salmon cterm=none ctermfg=249
:hi Include guifg=red ctermfg=110
:hi PreProc guifg=red guibg=white ctermfg=98
:hi Operator cterm=none guifg=Red ctermfg=124
:hi MatchParen cterm=bold ctermbg=none ctermfg=111
:hi Define guifg=gold gui=bold cterm=bold ctermfg=196
:hi Type guifg=CornflowerBlue ctermfg=110
:hi Function guifg=navajowhite cterm=bold ctermfg=4
:hi Structure guifg=green ctermfg=green
:hi LineNr guifg=grey50 ctermbg=238 ctermfg=242
:hi Ignore guifg=grey40 cterm=bold ctermfg=7
:hi Todo guifg=orangered guibg=yellow2
:hi Directory ctermfg=darkcyan
:hi ErrorMsg cterm=bold guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
:hi VisualNOS cterm=bold,underline
:hi WildMenu ctermfg=0 ctermbg=3
:hi DiffAdd ctermbg=4
:hi DiffChange ctermbg=5
:hi DiffDelete cterm=bold ctermfg=4 ctermbg=6
:hi DiffText cterm=bold ctermbg=1
:hi Underlined cterm=underline ctermfg=5
:hi Error guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
:hi SpellErrors guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1

:hi perlRepeat ctermfg=blue
:hi perlConditional ctermfg=blue
:hi perlStatementStorage ctermfg=blue
:hi perlStatementControl ctermfg=blue
:hi perlStatementFlow ctermfg=blue
:hi perlStatementInclude ctermfg=blue
:hi perlFunction ctermfg=blue
:hi perlStatementPackage ctermfg=blue
:hi perlPackageDecl ctermfg=darkmagenta

:hi clear SignColumn

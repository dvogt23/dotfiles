syntax region htmlH1 matchgroup=Type start="#\ " end="$" concealends
syntax region htmlH2 matchgroup=Type start="##\ " end="$" concealends
syntax region htmlH3 matchgroup=Type start="###\ " end="$" concealends
syntax region htmlH4 matchgroup=Type start="####\ " end="$" concealends
syntax region htmlH5 matchgroup=Type start="#####\ " end="$" concealends
"  containedin=mkdNonListItemBlock,mkdListItemLine

hi htmlH1 ctermfg=88   guibg=#4E737F guifg=white ctermbg=None gui=bold  term=bold cterm=bold
hi htmlH2 ctermfg=106  guibg=#51D2FF guifg=black ctermbg=None gui=bold
hi htmlH3 ctermfg=166  guibg=#9DE6FF guifg=black ctermbg=None gui=bold
hi htmlH4 ctermfg=109  guibg=#28697F guifg=white ctermbg=None gui=bold
hi htmlH5 ctermfg=124  guibg=#7EB8CC guifg=black ctermbg=None gui=bold
" hi htmlH1 ctermfg=88   guibg=#27B0BA guifg=black ctermbg=None gui=bold  term=bold cterm=bold
" hi htmlH2 ctermfg=106  guibg=#31A0A0 guifg=black ctermbg=None gui=bold
" hi htmlH3 ctermfg=166  guibg=#3989A1 guifg=white ctermbg=None gui=bold
" hi htmlH4 ctermfg=109  guibg=#40D5D8 guifg=black ctermbg=None gui=bold
" hi htmlH5 ctermfg=124  guibg=#32C0C7 guifg=black ctermbg=None gui=bold

hi mkdCodeStart ctermfg=239 guifg=#9E9E9E ctermbg=None gui=bold
hi mkdCodeEnd ctermfg=239 guifg=#9E9E9E ctermbg=None gui=bold
hi mkdCode ctermfg=88  guifg=#427b58 ctermbg=None cterm=bold


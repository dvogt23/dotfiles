let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 10000

nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

nmap <Leader>gh <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)

omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

set signcolumn=no
" let g:gitgutter_signs = 0
let g:gitgutter_highlight_linenrs = 1

highlight link GitGutterAddLineNr GitGutterChange
highlight link GitGutterChangeLineNr GitGutterAdd
highlight link GitGutterDeleteLineNr GitGutterDelete
highlight link GitGutterChangeDeleteLineNr GitGutterChangeDelete


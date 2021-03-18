let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 10000
let g:gitgutter_preview_win_floating = 1

nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

nmap <Leader>gh <Plug>(GitGutterStageHunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)

omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

" set signcolumn=no
" let g:gitgutter_signs = 0
" let g:gitgutter_highlight_linenrs = 1
let g:bufferline_separator_active = '▎'
let g:bufferline_separator_inactive = '▎'
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_sign_modified_removed = '▌'

hi! link SignColumn LineNr
highlight link GitGutterAddLineNr GitGutterChange
highlight link GitGutterChangeLineNr GitGutterAdd
highlight link GitGutterDeleteLineNr GitGutterDelete
highlight link GitGutterChangeDeleteLineNr GitGutterChangeDelete


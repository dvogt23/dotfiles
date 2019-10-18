set termguicolors
if !has('gui_running')
  set t_Co=256
endif
let base16colorspace=256
colorscheme base16-atelier-seaside

" lightline configurations
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
    \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

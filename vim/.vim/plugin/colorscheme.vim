set termguicolors
if !has('gui_running')
  set t_Co=256
endif
let base16colorspace=256
set background=dark
syntax on
let ayucolor="dark"
colorscheme ayu

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified'] ]
      \ },
      \ }

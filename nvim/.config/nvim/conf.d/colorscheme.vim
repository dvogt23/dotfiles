set termguicolors
if !has('gui_running')
  set t_Co=256
endif
let base16colorspace=256
set background=dark
syntax on
let ayucolor="dark"
colorscheme ayu
hi CursorLineNr guibg=#222E39
hi CursorLine guibg=#222E39
hi CursorColumn guibg=#222E39

" hi DiffAdd guifg=green
" hi DiffChange guifg=orange

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

set noshowmode
let g:lightline = {}
let g:lightline.colorscheme = 'ayu'
let g:lightline.component = {
      \  'coc': '%{coc#status()}',
      \  'gitbranch': '%{fugitive#head()}',
      \ }
let g:lightline.active = {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'coc' ]],
      \ }


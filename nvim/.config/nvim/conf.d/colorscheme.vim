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
hi CursorColumn guibg=#222E39 guifg=orange

" hi DiffAdd guifg=green
" hi DiffChange guifg=orange

" highlight VertSplit guibg=Orange guifg=Black ctermbg=6 ctermfg=0
" let s:BSsplitscolor = ['darkestgreen', 'brightgreen']
" let s:p.normal.left = [ s:BSsplitscolor + ['bold'], ['white', 'gray4'] ]

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

set noshowmode
let g:lightline = {}
let g:lightline.colorscheme = 'ayu_dark'
let g:lightline.component = {
      \  'coc': '%{coc#status()}',
      \  'gitbranch': '%{fugitive#head()}',
      \ }
let g:lightline.active = {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'coc' ]],
      \ }


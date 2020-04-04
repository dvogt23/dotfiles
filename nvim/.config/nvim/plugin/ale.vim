let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'ℹ'
let g:ale_set_highlights = 0
" highlight ALEWarning ctermbg=DarkMagenta
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_linters = {
            \ 'rust'   : ['rustup', 'run', 'stable', 'rls'],
            \ 'sh'     : ['shellcheck', 'language_server'],
            \ 'tex'    : ['chktex', 'lacheck', 'vale'],
            \ 'python' : ['pylama'],
            \ 'cs'     : ['OmniSharp'],
            \ }
let g:ale_fixers = {
            \ 'rust'   : ['rustfmt'],
            \ 'sh'     : ['shfmt'],
            \ 'tex'    : ['latexindent'],
            \ 'python' : [
            \     'isort',
            \     'autopep8',
            \     'yapf',
            \     'remove_trailing_lines',
            \   ]
            \ }
let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_cargo_clippy_options = '--all-targets'
let g:ale_rust_rls_config = {
            \   'rust': {
            \     'clippy_preference': 'on'
            \   }
            \ }

let g:ale_fix_on_save = 1

nmap [a <Plug>(ale_previous_wrap)
nmap ]a <Plug>(ale_next_wrap)

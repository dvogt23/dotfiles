autocmd User Startified setlocal cursorline

let g:startify_files_number = 8

let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_relative_path = 1

let g:ctrlp_reuse_window = 'startify'
let g:startify_fortune_use_unicode = 1

let g:startify_session_dir = '~/.local/share/nvim/sessions'
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_sort = 1

let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
let g:startify_bookmarks = [
            \ { 'v': '~/.vimrc' },
            \ { 't': '~/.tmux.conf' },
            \ { 'i': '~/.config/i3/config' },
            \ { 'b': '~/.config/polybar/config' },
            \ { 'z': '~/.zshrc' },
            \ ]

hi StartifyHeader  ctermfg=114

let g:startify_change_to_dir = 0
let g:ctrlp_reuse_window = 'startify'

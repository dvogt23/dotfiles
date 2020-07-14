let g:vimwiki_list = [{'path': '~/Privat/Notes/',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'path_html': '~/Privat/Notes/html'}]

let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_listsym_rejected = '✗'
let g:vimwiki_dir_link = 'README'
let g:vimwiki_header_type = '#'

let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
let g:zettel_format = "%y%m%d-%H%M-%title"

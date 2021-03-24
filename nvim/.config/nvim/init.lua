require "settings"
require "plugins"
require "lsp"

vim.cmd 'colorscheme doom-one'

vim.cmd 'hi BufTabLineFill guifg=DarkBlue guibg=none'

vim.cmd 'let g:NERDCreateDefaultMappings = 0'

--vim.cmd 'g:bclose_no_plugin_maps = true'

vim.cmd 'let g:bufferline_separator_active = "▎"'
vim.cmd 'let g:bufferline_separator_inactive ="▎"'

vim.cmd 'let g:gitgutter_sign_added = "▌"'
vim.cmd 'let g:gitgutter_sign_modified = "▌"'
vim.cmd 'let g:gitgutter_sign_removed = "▁"'
vim.cmd 'let g:gitgutter_sign_removed_first_line = "▌"'
vim.cmd 'let g:gitgutter_sign_modified_removed = "▌"'

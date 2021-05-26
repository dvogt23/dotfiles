require "settings"
require "plugins"
require "lsp"
local highlights = require "settings.utils".highlights
require("todo-comments").setup { }

vim.cmd 'let g:ranger_map_keys = 0'
vim.cmd 'let g:gitgutter_map_keys = 0'
vim.cmd 'colorscheme ayu'
-- vim.cmd 'hi VertSplit guifg=DarkGrey'
-- vim.cmd 'hi BufTabLineActive guibg=bg'
-- vim.cmd 'hi lspReference ctermfg=red guifg=red ctermbg=green guibg=green'
vim.cmd 'let vim_markdown_preview_pandoc=1'
vim.cmd 'let vim_markdown_preview_browser="Firefox"'

-- nvim-tree lag on save, turn off git
vim.g.nvim_tree_git_hl = 0

--highlights({
--  VertSplit = { fg=DarkGrey },
--  BufTabLineHidden = { bg=bg }
--})

vim.cmd 'let g:NERDCreateDefaultMappings = 0'

vim.cmd 'let g:gitgutter_sign_added = "▌"'
vim.cmd 'let g:gitgutter_sign_modified = "▌"'
vim.cmd 'let g:gitgutter_sign_removed = "▁"'
vim.cmd 'let g:gitgutter_sign_removed_first_line = "▌"'
vim.cmd 'let g:gitgutter_sign_modified_removed = "▌"'

vim.api.nvim_exec(
[[
command! CloseHiddenBuffers call CloseHiddenBuffers()
function! CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction
]],
true)

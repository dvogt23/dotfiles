vim.cmd 'let g:ranger_map_keys = 0'
vim.cmd 'let g:gitgutter_map_keys = 0'
-- vim.g.tokyonight_style = "night"
-- vim.cmd 'hi VertSplit guifg=DarkGrey'
-- vim.cmd 'hi BufTabLineActive guibg=bg'
-- vim.cmd 'hi lspReference ctermfg=red guifg=red ctermbg=green guibg=green'
vim.cmd 'let vim_markdown_preview_pandoc=1'
vim.cmd 'let vim_markdown_preview_browser="Firefox"'
vim.cmd 'hi VimwikiHeader1 guifg=black guibg=yellow'
vim.cmd 'hi VimwikiHeader2 guifg=black guibg=lightgrren'
vim.cmd 'hi VimwikiHeader3 guifg=black guibg=lightgrey'
vim.cmd 'hi VimwikiHeader4 guifg=black guibg=red'
vim.cmd 'hi VimwikiHeader5 guifg=black guibg=blue'
vim.cmd 'hi VimwikiHeader6 guifg=black guibg=pink'
vim.cmd 'hi markdownH1 guifg=black guibg=pink'
vim.cmd 'hi markdownH2 guifg=black guibg=pink'
vim.cmd 'autocmd FileType markdown highlight htmlH1 cterm=none ctermfg=70'

-- nvim-tree lag on save, turn off git
vim.g.nvim_tree_git_hl = 0

-- highlights({
--   htmlH1 = { fg=DarkGrey },
--   mkdHeading = { bg=fg }
-- })

vim.cmd 'let g:NERDCreateDefaultMappings = 0'

vim.cmd 'hi HopNextKey guifg=red'
vim.cmd 'hi HopNextKey1 guifg=red'
vim.cmd 'hi HopNextKey2 guifg=red'

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

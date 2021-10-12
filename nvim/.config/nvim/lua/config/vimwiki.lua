local M = {}

function M.setup()
   vim.g.vimwiki_list = {{
      path = '~/Privat/Notes/',
      path_html = '~/Privat/Notes/html',
      syntax = 'markdown',
      index = 'SUMMARY',
      ext = '.md',
   }}
   vim.g.vimwiki_listsyms = '✗○◐●✓'
   vim.g.vimwiki_listsym_rejected = '✗'
   vim.g.vimwiki_dir_link = 'README'
   vim.g.vimwiki_header_type = '#'

   vim.g.zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
   vim.g.zettel_format = "%y%m%d-%H%M-%title"

   vim.api.nvim_exec(
   [[
   function! SetJournalMode()
      execute 'normal gg'
      let filename = '#' . ' ' . expand("<afile>:t:r")
      call setline(1, filename)
      execute 'normal oD'
   endfunction
   ]],
   true)
end

return M


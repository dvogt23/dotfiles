local fn = vim.fn
local cmd = vim.cmd
local exec = vim.api.nvim_exec

-- Auto save files when focus is lost
-- cmd "au FocusLost * silent! :wa!"
cmd "au TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 800})"
--cmd "au BufEnter * set fo-=c fo-=r fo-=o"
cmd "au TermOpen * setlocal signcolumn=no nonumber norelativenumber"
cmd "au BufNewFile,BufRead .eslintignore,.prettierignore,.aliases setf conf"
cmd "au BufNewFile,BufRead .eslintrc,.prettierrc,tsconfig.json setf json"

-- cmd "au BufWritePost * FormatWrite"
cmd "au BufWritePre * lua vim.lsp.buf.formatting()"
cmd "au BufWritePost * normal! zv"

cmd "au FileType gitcommit inoremap <buffer>jj <ESC>ZZ"
cmd "au FileType gitcommit setl spell"
--cmd "au FileType html,css,scss,javascript,javascriptreact,vue,typescript,typescriptreact EmmetInstall"

cmd "au BufEnter *.txt lua require('settings.utils').help_tab()"
-- Open image file in system preview
cmd [[au BufEnter *.png,*.jpg,*.gif,*.ico exec "silent !open ".expand("%") | :bw"]]
-- cmd [[au BufEnter *.png,*.jpg,*gif exec "! kitty +kitten icat ".expand("%") | :bw]]

-- Return to last edited line
cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif]]

cmd "au CmdlineLeave : echo ''"
cmd "au BufRead,BufNewFile *.md setlocal textwidth=80"
cmd "au BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh"
cmd "au FileType markdown set wrap"
cmd "au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab"

cmd "command! LSPReload lua reload_lsp()"
cmd "command! LSPDebug lua print(vim.inspect(vim.lsp.get_active_clients()))"
cmd "command! LSPLog lua open_lsp_log()"

-- Startuptime
exec(
  [[
  if has('vim_starting') && has('reltime')
   let g:startuptime = reltime()
   augroup vimrc-startuptime
     autocmd!
     autocmd VimEnter * echomsg 'startuptime:' . reltimestr(reltime(g:startuptime))
   augroup END
 endif
]],
  ""
)

exec(
  [[
augroup journal
    autocmd!

    " populate journal template
    autocmd BufNewFile */diary/** 0r ~/.config/nvim/templates/journal.skeleton

    " set header for the particular journal
    autocmd BufNewFile */diary/**   :call SetJournalMode()

    " other configurations
    autocmd VimEnter */diary/**   set ft=markdown
    autocmd VimEnter */diary/**   syntax off
    autocmd VimEnter */diary/**   setlocal nonumber norelativenumber
augroup end
  ]], ""
)

exec(
  [[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
  augroup END
]],
  ""
)

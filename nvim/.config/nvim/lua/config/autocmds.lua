local cmd = vim.cmd
local api = vim.api
local exec = vim.api.nvim_exec

-- Auto save files when focus is lost
cmd("au FocusLost * silent! :wa!")

-- Highlight yanked content
cmd("au TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 800})")

--cmd "au BufEnter * set fo-=c fo-=r fo-=o"

--- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  command = [[:%s/\s\+$//e]],
  group = TrimWhiteSpaceGrp,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  -- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
  {
    pattern = { "*.txt", "*.md", "*.tex" },
    callback = function()
      vim.opt.spell = true
      vim.opt.spelllang = "en,de_20"
    end,
  }
)

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

cmd("au TermOpen * setlocal signcolumn=no nonumber norelativenumber")
cmd("au BufNewFile,BufRead .eslintignore,.prettierignore,.aliases setf conf")
cmd("au BufNewFile,BufRead .eslintrc,.prettierrc,tsconfig.json setf json")

-- cmd "au BufWritePost * FormatWrite"
cmd("au BufWritePre * lua vim.lsp.buf.format()")
-- cmd "au BufWritePost * normal! zv"

cmd("au FileType gitcommit inoremap <buffer>jj <ESC>ZZ")
cmd("au FileType gitcommit setl spell")

-- Open image file in system preview

-- Return to last edited line
cmd(
  [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' | exe "normal! g'\"" | endif]]
)

cmd("au CmdlineLeave : echo ''")
cmd("au BufRead,BufNewFile *.md setlocal textwidth=80")

-- Filetypes
-- images
cmd([[au BufEnter *.png,*.jpg,*.gif,*.ico exec "silent !open ".expand("%") | :bw"]])
-- cmd [[au BufEnter *.png,*.jpg,*gif exec "! kitty +kitten icat ".expand("%") | :bw]]

-- sh
cmd("au BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh")

-- markdown
cmd("au FileType markdown set wrap")
cmd("au FileType markdown set conceallevel=2")

-- yml
cmd("au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab")

-- Commands
cmd("command! LSPReload lua reload_lsp()")
cmd("command! LSPDebug lua print(vim.inspect(vim.lsp.get_active_clients()))")
cmd("command! LSPLog lua open_lsp_log()")

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
    autocmd BufNewFile */diary/** 0r ~/.config/nvim/templates/skeleton.journal

    " set header for the particular journal
    autocmd BufNewFile */diary/**   :call SetJournalMode()

    " other configurations
    autocmd VimEnter */diary/**   set ft=markdown
    autocmd VimEnter */diary/**   syntax off
    autocmd VimEnter */diary/**   setlocal nonumber norelativenumber
augroup end
  ]],
  ""
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

" set indent rules for yaml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" disable statusline when fzf is active
autocmd! FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" setting wrap while editing markdown files
autocmd FileType markdown set wrap

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh
  augroup END
endif

au BufRead,BufNewFile *.md setlocal textwidth=80

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

augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

autocmd TermOpen * setlocal nonumber norelativenumber

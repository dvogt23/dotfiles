nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gc :Gwrite<bar>w<bar>Gcommit<cr>A
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gl :Gpull<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gp :w<bar>Gpush<cr>
nnoremap <leader>gf :Gfetch<cr>
nnoremap <leader>go :Gpull --rebase<cr>

au FileType gitcommit inoremap <buffer>jj <ESC>ZZ

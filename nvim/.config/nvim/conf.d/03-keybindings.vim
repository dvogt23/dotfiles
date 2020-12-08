inoremap jj <ESC>
inoremap jk <ESC>
cnoremap jk <ESC>

nnoremap <silent> <C-,> :ToggleTerminal<Enter>
tnoremap <silent> <C-,> <C-\><C-n>:ToggleTerminal<Enter>

map <Space> <leader>
nmap <leader>q :q!<cr>
nmap <leader>w :w!<cr>
nmap <leader>ww :noa w!<cr>
nmap <leader>l :bnext<cr>
nmap <leader>f :Files<cr>
nmap <Leader>gha <Plug>(GitGutterStageHunk)
nmap <leader>g :Goyo<cr>
nmap <leader>gnh <Plug>(GitGutterNextHunk)
nmap <leader>gph <Plug>(GitGutterPrevHunk)
nmap <leader>h :bprevious<cr>
nmap <Leader>ghr <Plug>(GitGutterUndoHunk)
nmap <Leader>ghp <Plug>(GitGutterPreviewHunk)
nmap <leader>gf :GFiles<cr>
nmap <C-p> :GFiles<cr>
" nmap <C-P> :Commands<cr>
" nmap <C-t> :Tags<cr>
nmap <C-T> :BTags<cr>
nmap <C-F> :Rg<cr>
nmap <leader>ff :FZF<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>j <Plug>(easymotion-bd-f)
nmap <leader>d :bd<cr>
nmap <leader>dd :Bclose<cr>
nmap <leader>vl :vertical resize +10<cr>
nmap <leader>vh :vertical resize -10<cr>
nmap <leader>vj :res +10<cr>
nmap <leader>vk :res -10<cr>
nmap <leader>ev :vsp ~/.config/nvim/init.vim<cr>
nmap <leader>sv :source ~/.config/nvim/init.vim<cr>
nmap <leader>pi :PlugInstall<cr>
nmap <leader>n :Lexplore<cr>
nmap <leader>ew :call StripWhiteSpace()<cr>
nmap <leader>t :Vista!!<cr>
nmap <leader>p :set nopaste<cr>
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

nnoremap j gj
nnoremap k gk
nnoremap 0 ^
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap Q <Nop>
nnoremap U <Nop>
noremap <cr> :noh<cr><cr>

" Moving characters
nno L xp
nno H Xph
" nno J ddjP
" nno K ddkP

" inoremap <c-j> <Esc>/<+\w*+><CR><Esc>cf>
" inoremap <c-k> <Esc>?<+\w*+><CR><Esc>cf>

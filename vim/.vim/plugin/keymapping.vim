let mapleader = " "
let g:mapleader = " "

inoremap jj <ESC>
inoremap jk <ESC>
cnoremap jk <ESC>

nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>nh <Plug>GitGutterNextHunk
nmap <leader>ph <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <leader>f :Files<cr>
nmap <leader>gf :GFiles<cr>
nmap <leader>ff :FZF<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>j <Plug>(easymotion-bd-f)
nmap <leader>d :bd<cr>
nmap <leader>vl :vertical resize +10<cr>
nmap <leader>vh :vertical resize -10<cr>
nmap <leader>vj :res +10<cr>
nmap <leader>vk :res -10<cr>
nmap <leader>ev :vsp ~/.vimrc<cr>
nmap <leader>sv :source ~/.vimrc<cr>
nmap <leader>pi :PlugInstall<cr>
nmap <leader>n :Lexplore<cr>
nmap <leader>ew :StripWhitespace<cr>
nmap <leader>t :IndentLinesToggle<cr>
nmap <leader>p :set nopaste<cr>

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

inoremap <c-j> <Esc>/<+\w*+><CR><Esc>cf>
inoremap <c-k> <Esc>?<+\w*+><CR><Esc>cf>

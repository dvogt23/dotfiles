" Keys {{{
let mapleader = " "
let g:mapleader = " "

inoremap jj <ESC>
inoremap jk <ESC>
cnoremap jk <ESC>

nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>p :CtrlP ~/docs/<cr>
nmap <leader>g :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>f :FZF<cr>
nmap <leader>d :bd<cr>
nmap <leader>o o<ESC>
nmap <leader>O O<ESC>
nmap <leader>vl :vertical resize +10<cr>
nmap <leader>vh :vertical resize -10<cr>
nmap <leader>vj :res +10<cr>
nmap <leader>vk :res -10<cr>
nmap <leader>sp :setlocal spell spelllang=en_us<cr>
nmap <leader>sp :setlocal spell!<cr>
nmap <leader>ev :vsp $MYVIMRC<cr>
nmap <leader>ez :vsp ~/.zshrc<cr>
nmap <leader>ea :Ag <c-r><c-w><cr>
nmap <leader>sv :source $MYVIMRC<cr>
nmap <leader>pi :PlugInstall<cr>
nmap <leader>u :GundoToggle<cr>
nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>ew :StripWhitespace<cr>
nmap <leader>t :IndentLinesToggle<cr>
nmap <leader>a :Ag<cr>
nmap <leader>i <leader>ci
"nmap <leader>gco :Gread<cr>
"nmap <leader>grh :Gwrite<cr>
nmap <leader><leader> <c-^>
nmap <leader>p :set nopaste<cr>
nmap ,cd :cd %:p:h<cr>

nnoremap j gj
nnoremap k gk
nnoremap 0 ^
nnoremap K i<cr><esc>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-e> 5<C-e>
nnoremap <C-q> 5<C-y>
nnoremap <C-y> 5<C-y>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap Q <Nop>
nnoremap U <Nop>
nnoremap <leader>d :bp<cr>:bd #<cr>
noremap <cr> :noh<cr><cr>
"nnoremap
" Moving characters
nno L xp
nno H Xph

inoremap <c-j> <Esc>/<+\w*+><CR><Esc>cf>
inoremap <c-k> <Esc>?<+\w*+><CR><Esc>cf>

" gitgutter
nnoremap ]h <Plug>GitGutterNextHunk
nnoremap [h <Plug>GitGutterPrevHunk
nnoremap <Leader>aar <Plug>GitGutterUndoHunk
nnoremap <Leader>av <Plug>GitGutterPreviewHunk
nnoremap <Leader>au <Plug>GitGutterRevertHunk
nnoremap <Leader>aa <Plug>GitGutterStageHunk
"}}}

" General  {{{
" ui
set ruler
set number
set hid
set showcmd
set cmdheight=1
set showmatch
set wrap
set autoread
set wildmenu
set scrolloff=3
set mouse=a
set number
set rnu
set list
set listchars=tab:→\ ,trail:·,precedes:«,extends:»
"set noesckeys
"set modifiable
:set noexpandtab
:set preserveindent
:set softtabstop=0
" copy indent from previous line: useful when using tabs for indentation
" and spaces for alignment
set copyindent

" style of divider
autocmd ColorScheme * hi VertSplit cterm=NONE ctermbg=NONE ctermfg=green

" line break
set linebreak
set textwidth=500

" blink speed
set mat=1

" proformence
set lazyredraw
set ttyfast

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" indent
set autoindent
set smartindent

" regex
set magic

" clipboard, yank, paste
set clipboard+=unnamedplus
set nopaste

" " Copy to clipboard
"vnoremap  <leader>y  "+y
"nnoremap  <leader>Y  "+yg_
"nnoremap  <leader>y  "+y
"nnoremap  <leader>yy  "+yy

" " Paste from clipboard
"nnoremap <leader>p "+p
"nnoremap <leader>P "+P
"vnoremap <leader>p "+p
"vnoremap <leader>P "+P

" map double ESC to nohl
nnoremap <silent> <Esc><Esc> :nohl<CR>

" errorbells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" doc and code styles
" set encoding=utf8
" set ffs=unix,dos,mac

" folding
set nofoldenable
set foldcolumn=0
set foldmethod=indent
set foldnestmax=5
set foldlevel=1

" backups, undos, swaps
set directory=~/.vim/tmp/
set backupdir=~/.vim/tmp/
set history=1000
set undolevels=1000
set undoreload=10000
set noundofile
set undodir=~/.vim/tmp/undo/
set nobackup
set nowb
set noswapfile

" tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" ignores
set wildignore+=*.a,*.0
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.mov,*.pdf,*.psd,*.ai
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xls,*.xlsx
set wildignore=*.o,*~,*.pyc

" set cursorline
" set autochdir

" remember info about open buffers on close
"set viminfo^=%

" cursorline in active buffer
"au BufEnter * setlocal cursorline
"au BufLeave * setlocal nocursorline

" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

"UI
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nightsense/vim-crunchbang'
Plug 'flazz/vim-colorschemes'
"Plug 'junegunn/rainbow_parentheses.vim'
"Plug 'luochen1990/rainbow'
Plug 'dpc/vim-smarttabs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify'
"Plug 'timakro/vim-searchant'
Plug 'rakr/vim-two-firewatch'
Plug 'rakr/vim-one'
Plug 'dylanaraps/ryuuko'
"Plug 'scrooloose/nerdcommenter'
"Plug 'gorodinskiy/vim-coloresque'
Plug 'chrisbra/Colorizer'
Plug 'Suave/vim-colors-guardian'
Plug 'terryma/vim-multiple-cursors'

"languages
"Plug 'hail2u/vim-css3-syntax',                 { 'for': [ 'css', 'less', 'scss' ] }
"Plug 'groenewege/vim-less',                    { 'for': 'less' }
Plug 'mattn/emmet-vim',                        { 'for': [ 'html', 'handlebars'] }
Plug 'othree/html5.vim',                       { 'for': 'html' }
Plug 'suan/vim-instant-markdown',              { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown',                { 'for': 'markdown' }
Plug 'fatih/vim-go',                           { 'for': 'go' }
"plug 'klen/python-mode',                       { 'for': 'python' }
Plug 'rust-lang/rust.vim'
Plug 'timonv/vim-cargo'
Plug 'gregsexton/MatchTag',
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim',      { 'for': 'rust' } " Rust filetype * CHECK OPTIONS *
Plug 'racer-rust/vim-racer',    { 'for': 'rust' }
Plug 'timonv/vim-cargo',      { 'for': 'rust' }
Plug 'cespare/vim-toml',      { 'for': 'toml' }

if has('nvim')
  Plug 'benekastah/neomake'
  Plug ('Shougo/deoplete.nvim'),      { 'do': ':UpdateRemotePlugins' } " Code completion
  Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
else
  Plug 'Valloric/YouCompleteMe',      { 'do': './install.py --racer-completer' }
  Plug 'scrooloose/syntastic',                 { 'on': 'SyntasticCheck' }
endif

"tools
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'jceb/vim-orgmode'
"Plug 'mileszs/ack.vim'
"Plug 'rking/ag.vim'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'scrooloose/nerdtree',                    { 'on':  'NERDTreeToggle' }
Plug 'sjl/gundo.vim',                          { 'on': 'GundoToggle' }
"Plug 'Valloric/YouCompleteMe',                 { 'do': './install.py' }
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'gioele/vim-autoswap'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-repeat'
"Plug 'svermeulen/vim-easyclip'
Plug 'vim-scripts/Rename'
Plug 'junegunn/fzf',                           { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace',         { 'on': 'StripWhitespace' }
call plug#end()
" }}}

" Colors and Schemes {{{

" Nvim 0.1.5 true color support
set termguicolors

set background=dark
colorscheme ThemerVim

" Vim inside Tmux might need these color settings
"set t_8b=^[[48;2;%lu;%lu;%lum
"set t_8f=^[[38;2;%lu;%lu;%lum

"}}}

" Rust {{{

let g:rustfmt_autosave = 1

"}}}

" Airline {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'one'

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" }}}

" Commenters {{{
let g:NERDCustomDelimiters = { 'handlebars': { 'left': '<!--','right': '-->' } }
let g:NERDCustomDelimiters = { 'hbs': { 'left': '<!--','right': '-->' } }

let g:NERDCustomDelimiters = { 'js': { 'left': '{/*','right': '*/}' } }
" }}}

" NERDTree {{{
"autocmd FileType nerdtree noremap <buffer> <leader>q <nop>
autocmd FileType nerdtree noremap <buffer> <leader>l <nop>
autocmd FileType nerdtree noremap <buffer> <leader>h <nop>
autocmd FileType nerdtree noremap <buffer> <leader>f <nop>
" disable nerdtree and ctlrp split
autocmd User Startified setlocal buftype=
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" Startify {{{
let g:startify_bookmarks = [
            \ { 'v': '~/.vimrc' },
            \ { 'i': '~/.config/i3/config' },
            \ { 'b': '~/.config/polybar/config' },
            \ { 'z': '~/.zshrc' },
            \ ]

hi StartifyHeader  ctermfg=114

let g:startify_change_to_dir = 0
let g:ctrlp_reuse_window = 'startify'

" }}}

" Syntastic {{{

if !has('nvim')
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_javascript_checkers = ['jscs']
  let g:syntastic_html_tidy_exec = 'tidy5'
  let jshint2_read = 1
  let jshint2_save = 1
  let g:syntastic_check_on_open = 1

  " dispaly all errors for mutiple checkers
  let g:syntastic_aggregate_errors = 1
endif

" }}}

" Deoplete - Completion framework {{{
if has('nvim')
    let g:deoplete#enable_at_startup = 1

    " Rust
    let g:deoplete#sources#rust#racer_binary='$HOME/.cargo/bin/racer'
    let g:deoplete#sources#rust#rust_source_path='$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
    let g:deoplete#sources#rust#show_duplicates=1
    let g:deoplete#sources#rust#disable_keymap=1
    let g:deoplete#sources#rust#documentation_max_height=20
endif

" }}}

" Neomake {{{

if has('nvim')
  " Enable Neomake to run cargo asynchronously on saving rust files
  " autocmd! BufWritePost *.rs Neomake! cargo
  autocmd! BufWritePost,BufEnter * Neomake

  " NeoMake: Enable messages
  let g:neomake_verbose = 3
endif

"}}}

" Provider {{{

let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" }}}

" Snippets {{{
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" }}}

" Autocmd {{{
" disbale format comments options
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" }}}

" Rainbow Parenthese {{{
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"}}}

" Markdown {{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:instant_markdown_autostart = 0
"}}}

" Gundo {{{
let g:gundo_width = 80
let g:gundo_preview_height = 30
let g:gundo_right = 1
" }}}

" You Complete Me {{{
"autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>
"}}}

" fzf vim {{{

" this is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%' }

" customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', ''],
  \ 'fg+':     ['fg', ''],
  \ 'bg+':     ['bg', ''],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] to customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
"}}}

" IndentLine {{{
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0

" suppose to work here
"let g:indentLine_color_term = 'red'

" overwrites the default color
let g:indentLine_color_gui = '#3f4041'
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_leadingSpaceChar = '·'
"}}}

" Notes {{{
:let g:notes_directories = ['~/.dotfiles/notes']
:let g:notes_suffix = '.md'
" }}}

" Ag {{{
" start searching from project root
"let g:ag_working_path_mode="r"
"}}}

" Helpers {{{

" remove trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"}}}

" Abbreviations {{{
iabbrev teh the
iabbrev waht what
iabbrev aray array
iabbrev seperate separate
iabbrev fuction function
iabbrev fucntion function
iabbrev fnction function
iabbrev functon function
iabbrev funtion function
iabbrev funciont function
iabbrev fnuction function
iabbrev fucntion function
iabbrev functino function
iabbrev consoel console
iabbrev consloe console
iabbrev tempalte template
iabbrev fitler filter
iabbrev fonrt font
iabbrev sytle style
iabbrev dvi div
iabbrev calss class
iabbrev classNmae className
iabbrev classnmae className
iabbrev classname className
iabbrev componnet component
" }}}

" Personal {{{
filetype plugin indent on
let maplocalleader = "\\"
" }}}

" vim:foldmethod=marker:foldlevel=0

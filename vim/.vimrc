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
nmap <leader>nh <Plug>GitGutterNextHunk
nmap <leader>ph <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <leader>f :Files<cr>
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

set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
set list!

"set noesckeys
"set modifiable
set noexpandtab
set preserveindent
set softtabstop=0
" copy indent from previous line: useful when using tabs for indentation
" and spaces for alignment
set copyindent

" line break
set linebreak
set textwidth=80

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
"set autoindent
"set smartindent

" regex
set magic

" clipboard, yank, paste
set clipboard+=unnamedplus
set nopaste

" map double ESC to nohl
nnoremap <silent> <Esc><Esc> :nohl<CR>

" errorbells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" doc and code styles
set encoding=utf8
set ffs=unix,dos,mac

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

"set cursorline
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'ayu-theme/ayu-vim-airline'
Plug 'lokaltog/vim-easymotion'
let ayucolor="mirage"   " for dark version of theme
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
"languages
Plug 'fatih/vim-go',                           { 'for': 'go' }
Plug 'timonv/vim-cargo'
Plug 'tpope/vim-surround'
Plug 'rust-lang/rust.vim',      { 'for': 'rust' } " Rust filetype * CHECK OPTIONS *
Plug 'timonv/vim-cargo',      { 'for': 'rust' }
Plug 'cespare/vim-toml',      { 'for': 'toml' }
Plug 'avakhov/vim-yaml'

if has('nvim')
    Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
endif

"tools
Plug 'vimwiki/vimwiki'
"Plug 'xolox/vim-notes'
Plug 'tpope/vim-fugitive'
function! DoRemote(arg)
    UpdateRemotePlugins
endfunction
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf',                           { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
if has('nvim')
    Plug 'autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'bash install.sh',
                \ }

    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf'

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#auto_complete_delay = 10
endif

call plug#end()
" }}}

" Colors and Schemes {{{

" Nvim 0.1.5 true color support
highlight ColorColumn ctermbg=gray
set colorcolumn=80
"match ErrorMsg '\%>80v.\+'

if has('nvim')
    set termguicolors
endif

set background=dark
colorscheme ayu
"colorscheme ThemerVim
"colorscheme apprentice

" Vim inside Tmux might need these color settings
if has('nvim')
    set t_8b=^[[48;2;%lu;%lu;%lum
    set t_8f=^[[38;2;%lu;%lu;%lum
endif

"}}}

" Rust {{{

let g:rustfmt_autosave = 1

"}}}

" << LSP >> {{{
let g:LanguageClient_autoStart = 1
nnoremap <leader>lcs :LanguageClientStart<CR>
" if you want it to turn on automatically
" let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
            \ 'python': ['pyls'],
            \ 'cpp': ['cquery'],
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'go': ['go-langserver'] }

set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
noremap <silent> K :call LanguageClient_textDocument_hover()<CR>

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ }

" }}}

" Airline {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'ayu'

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

" NetRW {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"autocmd!
"autocmd VimEnter * :Vexplore
"augroup END
" }}}

" Commenters {{{
let g:NERDCustomDelimiters = { 'handlebars': { 'left': '<!--','right': '-->' } }
let g:NERDCustomDelimiters = { 'hbs': { 'left': '<!--','right': '-->' } }

let g:NERDCustomDelimiters = { 'js': { 'left': '{/*','right': '*/}' } }
" }}}

" Startify {{{
autocmd User Startified setlocal cursorline

let g:startify_files_number = 8

let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_relative_path = 1

let g:ctrlp_reuse_window = 'startify'
let g:startify_fortune_use_unicode = 1

let g:startify_session_dir = '~/.local/share/nvim/sessions'
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_sort = 1

let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]
let g:startify_bookmarks = [
            \ { 'v': '~/.vimrc' },
            \ { 't': '~/.tmux.conf' },
            \ { 'i': '~/.config/i3/config' },
            \ { 'b': '~/.config/polybar/config' },
            \ { 'z': '~/.zshrc' },
            \ ]

hi StartifyHeader  ctermfg=114

let g:startify_change_to_dir = 0
let g:ctrlp_reuse_window = 'startify'

" }}}

" Sessions {{{
command! -nargs=1 SessionSave call Mks(<f-args>)
function! Mks(name)
    execute 'mksession! ~/.local/share/nvim/sessions/' . a:name . '-session.vim'
endfunction

command! -nargs=1 SessionRemove call Rms(<f-args>)
command! -complete=file -nargs=1 SessionRemove :echo '~/.local/share/nvim/sessions/' . a:name . '-session.vim'.' '.(delete('~/.local/share/nvim/sessions/' . <f-args> . '-session.vim') == 0 ? 'SUCCEEDED' : 'FAILED')
function! Rms(name)
    delete('~/.local/share/nvim/sessions/' . a:name . '-session.vim')
endfunction
" }}} Sessions
" }}} Sessions

" Syntastic {{{

if has('nvim')
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

" Provider {{{

let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" }}}

" Autocmd {{{
" disbale format comments options
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" }}}

" Markdown {{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:instant_markdown_autostart = 0
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

function! s:fzf_neighbouring_files()
    let current_file =expand("%")
    let cwd = fnamemodify(current_file, ':p:h')
    let command = 'ag -g "" -f ' . cwd

    call fzf#run({
                \ 'source': command,
                \ 'sink':   'e',
                \ 'options': '-m -x +s',
                \ 'down': '30%'})
endfunction

"command! FZFNeigh call s:fzf_neighbouring_files()
command! FZFNeigh call fzf#run(dir)
"}}}

" IndentLine {{{
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

" suppose to work here
let g:indentLine_color_term = 'red'

" overwrites the default color
let g:indentLine_color_gui = '#3f4041'
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_leadingSpaceChar = '·'
"}}}

" Notes {{{
set nocompatible
syntax on
":let g:notes_directories = ['~/.notes']
":let g:notes_suffix = '.md'
" }}}

" Helpers {{{

" remove trailing white space on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.rs :call DeleteTrailingWS()
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

" interactivly replace
set inccommand=split

" ui
" highlight ColorColumn
set colorcolumn=120
set termguicolors

set winblend=10
set lazyredraw
" set regexpengine=1

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
" set list!

" set noesckeys
set modifiable
set noexpandtab
set preserveindent
set softtabstop=0

" line break
set linebreak
set textwidth=120

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


" better complete
set complete+=U
set complete+=k
set complete+=kspell
set complete+=s

" indent
set autoindent
set smartindent

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
set foldmethod=syntax
set foldnestmax=5
set foldlevel=1

" Persistent Undo
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set backupdir=~/.config/nvim/backups
set undofile
set swapfile
set backup
set writebackup
set sessionoptions-=blank,help

" tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" ignores
set wildignore+=*.a,*.0
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.mov,*.pdf,*.psd,*.ai
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xls,*.xlsx
set wildignore=*.o,*~,*.pyc

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

set cursorline
" autocmd InsertEnter * highlight CursorLine guibg=#005000 guifg=fg
" autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg
set autochdir

" Show relative numbers in normal mode
autocmd InsertEnter * set nornu
autocmd InsertLeave * set rnu

autocmd BufWritePre * silent! call StripWhiteSpaces()
autocmd BufWritePre * %retab!

augroup myTodo
  autocmd!
  autocmd Syntax * syntax match myTodo /\v\_.<(FIXME|NOTE|TODO|OPTIMIZE|XXX).*/hs=s+1 containedin=.*Comment,vimCommentTitle
augroup END

" Vimwiki requirements
filetype plugin on
set nocompatible

highlight link myTodo Todo
" set re=1
" set conceallevel=0
" set synmaxcol=0
" remember info about open buffers on close
"set viminfo^=%

" cursorline in active buffer
"au BufEnter * setlocal cursorline
"au BufLeave * setlocal nocursorline

" ui
" highlight ColorColumn
" set colorcolumn=80

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

" Persistent Undo
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set backupdir=~/.vim/backups
set undofile
set swapfile
set backup
set writebackup
set sessionoptions-=blank,help

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

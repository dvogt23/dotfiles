" ui
" highlight ColorColumn
set colorcolumn=120
set termguicolors

" set regexpengine=1

set backspace=indent,eol,start  " Makes backspace key more powerful.
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
au FocusLost * :wa              " Set vim to save the file on focus out.

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

syntax sync minlines=256
set synmaxcol=300
" set re=1

" do not hide markdown
set conceallevel=0

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1

set ruler
set hid
set showcmd
set cmdheight=1
set showmatch
set autoread
set wildmenu
set scrolloff=3
set mouse=v
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

highlight link myTodo Todo

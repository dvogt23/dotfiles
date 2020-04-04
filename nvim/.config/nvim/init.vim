set runtimepath^=/usr/share/vim/vim82 runtimepath+=/usr/share/vim/vim82
let &packpath=&runtimepath

let $CONFIG_PATH = expand('$HOME/.config/nvim')

let $NVIM_PLUG_SOURCE = expand('$HOME/.local/share/nvim/site/autoload/plug.vim')
let $NVIM_PLUG_DIR = expand('$HOME/.local/share/nvim/plugged')
let $NVIM_SESSIONS_DIR = expand('$HOME/.local/share/nvim/sessions')

if empty(glob($NVIM_PLUG_SOURCE))
  silent !curl -fLo $NVIM_PLUG_SOURCE --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin($NVIM_PLUG_DIR)

" UI
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'

Plug 'flrnprz/candid.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'

" Plug 'liuchengxu/vista.vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'

" Movement
Plug 'easymotion/vim-easymotion'

" Build the extra binary if cargo exists on your system.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'liuchengxu/vista.vim'

Plug 'jremmen/vim-ripgrep',                 { 'on': 'Rg' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
" Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Languages
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

Plug 'tpope/vim-markdown',                  { 'for': 'markdown' }
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'fatih/vim-go',                        { 'for' : 'go' }
Plug 'rust-lang/rust.vim',                  { 'for' : 'rust' }
Plug 'arzg/vim-rust-syntax-ext'
Plug 'racer-rust/vim-racer'
Plug 'cespare/vim-toml',                    { 'for' : 'toml' }
Plug 'avakhov/vim-yaml'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'

" Toggle quickfix with \q and location list with \l
" Plug 'milkypostman/vim-togglelist'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

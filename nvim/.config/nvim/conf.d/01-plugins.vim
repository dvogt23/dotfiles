" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif 

call plug#begin('~/.config/nvim/bundle')

" UI
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'ludovicchabant/vim-gutentags'

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
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

" Movement
Plug 'easymotion/vim-easymotion'

" Build the extra binary if cargo exists on your system.
Plug 'liuchengxu/vista.vim'

Plug 'jremmen/vim-ripgrep',                 { 'on': 'Rg' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
" Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/dartlang-snippets'
let dart_format_on_save = 1
let dart_style_guide = 2
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

Plug 'neovim/nvim-lsp'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'

" Toggle quickfix with \q and location list with \l
" Plug 'milkypostman/vim-togglelist'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

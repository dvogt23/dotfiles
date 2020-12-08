" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif 

call plug#begin('~/.config/nvim/bundle')

Plug 'caenrique/nvim-toggle-terminal'

" UI
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
" Plug 'ludovicchabant/vim-gutentags'

" Plug 'axvr/org.vim'
Plug 'jceb/vim-orgmode'
" Plug 'xolox/vim-notes'
" Plug 'xolox/vim-misc'
Plug 'ap/vim-buftabline'

Plug 'romgrk/doom-one.vim'
Plug 'joshdick/onedark.vim'
Plug 'flrnprz/candid.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'Yggdroot/indentLine'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
let g:ranger_map_keys = 0

Plug 'dhruvasagar/vim-zoom'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

Plug 'mogelbrod/vim-jsonpath'
" Optionally copy path to a named register (* in this case) when calling :JsonPath
let g:jsonpath_register = '*'
" Define mappings for json buffers
au FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>

" Movement
Plug 'easymotion/vim-easymotion'

" Build the extra binary if cargo exists on your system.
Plug 'liuchengxu/vista.vim'

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'

" Languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'dart-lang/dart-vim-plugin'
" Plug 'natebosch/dartlang-snippets'
" let dart_format_on_save = 1
" let dart_style_guide = 2
Plug 'plasticboy/vim-markdown',                  { 'for': 'markdown' }
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'fatih/vim-go',                        { 'for' : 'go' }
Plug 'rust-lang/rust.vim',                  { 'for' : 'rust' }
Plug 'arzg/vim-rust-syntax-ext'
Plug 'racer-rust/vim-racer'
Plug 'cespare/vim-toml',                    { 'for' : 'toml' }
Plug 'avakhov/vim-yaml'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'norcalli/nvim-colorizer.lua'

" Ruby plugins
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'Keithbsmiley/rspec.vim', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }

Plug 'neovim/nvim-lsp'
Plug 'ervandew/supertab'
" Plug 'Chiel92/vim-autoformat'

" Plug 'pangloss/vim-javascript'
" Toggle quickfix with \q and location list with \l
" Plug 'milkypostman/vim-togglelist'

" Git
Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()

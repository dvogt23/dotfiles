local exec = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  exec "packadd packer.nvim"
end

cmd "packadd packer.nvim"

cmd "au BufWritePost packages.lua PackerCompile"


local init = {
  -- Packer can manage itself as an optional plugin
  "wbthomason/packer.nvim",
  opt = true
}

local lsp = {
--  "nvim-telescope/telescope.nvim",
--  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-compe",
  "folke/lsp-trouble.nvim",
  'folke/lsp-colors.nvim',
  -- "ojroques/nvim-lspfuzzy",
--  "glepnir/lspsaga.nvim",
  --{"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
}

local git = {
  "tpope/vim-fugitive",
  "airblade/vim-gitgutter",
  "stsewd/fzf-checkout.vim",
  "tpope/vim-rhubarb",
  "rhysd/conflict-marker.vim", -- Highlight conflict markers.[x and ]x, ct for themselves, co for ourselves, cn for none and cb
  "lewis6991/gitsigns.nvim",
  "f-person/git-blame.nvim",
  -- "TimUntersberger/neogit"
}

local misk = {
  "tweekmonster/startuptime.vim", -- benchmark startup
  --"preservim/nerdcommenter",
  "terrortylor/nvim-comment",
  "AndrewRadev/tagalong.vim", -- Auto change html tags
  "AndrewRadev/splitjoin.vim", -- allows to split one liner to multi lines
  "mbbill/undotree", -- undo tree
  "justinmk/vim-sneak",
  "machakann/vim-sandwich", -- Change surrounding arks
  "alvan/vim-closetag",
  "rrethy/vim-illuminate", -- highlight matching words when cursor on it
  "mhartington/formatter.nvim",
  "metakirby5/codi.vim", --Repl
  "whatyouhide/vim-lengthmatters",
  "mattn/emmet-vim",
  "andymass/vim-matchup",
  "tpope/vim-surround",
  "caenrique/nvim-toggle-terminal",
  "rbgrouleff/bclose.vim",
  'francoiscabrol/ranger.vim',
}

local fzf = {
  {"junegunn/fzf", run = function() vim.fn['fzf#install'](0) end},
  "junegunn/fzf.vim",
  "gfanto/fzf-lsp.nvim"
}

local langs = {
  -- "Galooshi/vim-import-js",
  "pangloss/vim-javascript",
  "maxmellon/vim-jsx-pretty",
  "editorconfig/editorconfig-vim",
  "vimwiki/vimwiki",
  "michal-h21/vim-zettel",
  "masukomi/vim-markdown-folding",
  "mogelbrod/vim-jsonpath",
  "plasticboy/vim-markdown",
  "JamshedVesuna/vim-markdown-preview",
  "fatih/vim-go",
  {"rust-lang/rust.vim", ft = 'rust'},
  {"arzg/vim-rust-syntax-ext", ft ='rust'},
  {"vim-ruby/vim-ruby", ft = 'ruby'},
  {"tpope/vim-rake", ft = 'ruby'},
  {"tpope/vim-rails", ft = 'ruby'},
  {"tpope/vim-rbenv", ft = 'ruby'},
  "tpope/vim-bundler",
  {"Keithbsmiley/rspec.vim", ft = 'ruby'},
  {"thoughtbot/vim-rspec", ft = 'ruby'},
}

local snippets = {
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  "mlaursen/vim-react-snippets",
  "dsznajder/vscode-es7-javascript-react-snippets",
}

local themes = {
  "embark-theme/vim",
  "arcticicestudio/nord-vim",
  "ayu-theme/ayu-vim",
  "romgrk/doom-one.vim",
  "jsit/toast.vim",
  "joshdick/onedark.vim",
  'tiagovla/tokyodark.nvim'
}

local ui = {
  "mhinz/vim-startify", -- start screen
  "kyazdani42/nvim-web-devicons",
  --"akinsho/nvim-bufferline.lua",
  "ap/vim-buftabline",
  "glepnir/galaxyline.nvim",
  "junegunn/goyo.vim",
  --"arecarn/vim-fold-cycle",
  "dhruvasagar/vim-zoom",
  "luochen1990/rainbow",
  "terryma/vim-multiple-cursors",
  "easymotion/vim-easymotion",
--  "kyazdani42/nvim-tree.lua",
  "norcalli/nvim-colorizer.lua",
}

local packer = require("packer")
packer.startup {
  {
    init,
    lsp,
    git,
    misk,
    fzf,
    langs,
    snippets,
    themes,
    ui
  },
  config = {
    display = {
      open_fn = require "packer.util".float
    }
  }
}

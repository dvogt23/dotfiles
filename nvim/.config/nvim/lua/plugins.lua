local M = {}

function M.setup()
  local packer = require "packer"

  -- local util = require "packer.util"
  -- packer.init({
  --     compile_path = util.join_paths(vim.fn.stdpath('config'), 'lua',
  --                                    'packer_compiled.lua')
  -- })

  packer.startup(function(use)
    -- Packer can manage itself as an optional plugin
    use { "wbthomason/packer.nvim", opt = true }

    -- Development
    use { "tpope/vim-dispatch" }
    -- use { "tpope/vim-fugitive" }
    use { "tpope/vim-surround" }
    use { "tpope/vim-commentary" }
    use { "tpope/vim-rhubarb" }
    use { "tpope/vim-unimpaired" }
    use { "tpope/vim-vinegar" }
    use { "tpope/vim-sleuth" }
    use { "wellle/targets.vim" }
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("config.sign").setup()
      end,
    }
    use { "f-person/git-blame.nvim" }
    use { "sindrets/diffview.nvim" }
    use { "ap/vim-buftabline" }
    use {"junegunn/fzf", run = ":call fzf#install()" }
    use { "junegunn/fzf.vim" }

    use {
      "gfanto/fzf-lsp.nvim"
    }

    use {
      "kyazdani42/nvim-tree.lua",
      config = function()
        require("config.tree").setup()
      end,
      requires = "kyazdani42/nvim-web-devicons",
    }
    use {
      "ruifm/gitlinker.nvim",
      config = function()
        require("gitlinker").setup()
      end,
    }
    use {
      "windwp/nvim-autopairs",
      run = "make",
      config = function()
        require("nvim-autopairs").setup {}
      end,
    }
    use {"terryma/vim-multiple-cursors"}
    use {"dhruvasagar/vim-zoom"}
    use {"terrortylor/nvim-comment"}
    use {'phaazon/hop.nvim'}


    -- Color scheme
    use { 'tiagovla/tokyodark.nvim'}
    use { 'folke/tokyonight.nvim' }
    use { 'NTBBloodbath/doom-one.nvim'}
    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    -- Telescope
    -- use { "nvim-lua/plenary.nvim" }
    -- use { "nvim-lua/popup.nvim" }
    -- use {
    --   "nvim-telescope/telescope.nvim",
    --   requires = {
    --     "nvim-telescope/telescope-project.nvim",
    --     "nvim-telescope/telescope-symbols.nvim",
    --     -- 'nvim-telescope/telescope-github.nvim',
    --     -- 'nvim-telescope/telescope-hop.nvim'
    --   },
    --   config = function()
    --     require("config.telescope").setup()
    --   end,
    -- }
    -- use {
    --   "nvim-telescope/telescope-frecency.nvim",
    --   requires = { "tami5/sql.nvim" },
    --   config = function()
    --     require("telescope").load_extension "frecency"
    --   end,
    -- }

    -- LSP config
    use { "neovim/nvim-lspconfig" }
    use { "kabouzeid/nvim-lspinstall" }
    use {
      "tamago324/nlsp-settings.nvim",
      config = function()
        require("config.nlsp-settings").setup()
      end,
    }

    -- Completion - use either one of this
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "quangnguyen30192/cmp-nvim-ultisnips",
        "hrsh7th/cmp-nvim-lua",
        "octaltree/cmp-look",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-emoji",
        "ray-x/cmp-treesitter",
      },
      config = function()
        require("config.cmp").setup()
      end,
    }
    use {
      "tzachar/cmp-tabnine",
      run = "./install.sh",
      requires = "hrsh7th/nvim-cmp",
    }
    use {
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init()
      end,
    }
    use { "sbdchd/neoformat" }
    use { "p00f/nvim-ts-rainbow" }
    use { "szw/vim-maximizer" }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end
    }
    use {
      "mfussenegger/nvim-ts-hint-textobject",
      config = function()
        vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
        vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
      end,
    }
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {}
      end,
    }
    use { "RRethy/nvim-treesitter-textsubjects" }
    use {
      "nacro90/numb.nvim",
      config = function()
        require("numb").setup()
      end,
    }
    use { "junegunn/vim-easy-align" }
    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    }

    use {
      "SirVer/ultisnips",
      requires = { "honza/vim-snippets" },
      config = function()
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end,
    }
  use {"hrsh7th/vim-vsnip"}
  use {"hrsh7th/vim-vsnip-integ"}
  use {"mlaursen/vim-react-snippets"}
  use {"dsznajder/vscode-es7-javascript-react-snippets"}

    -- Lua development
    use { "folke/lua-dev.nvim" }
    use {
      "simrat39/symbols-outline.nvim",
      config = function()
        require("config.symbols-outline").setup()
      end,
    }

    -- Better syntax
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("config.treesitter").setup()
      end,
    }
    use { "nvim-treesitter/nvim-treesitter-textobjects" }
    use { "nvim-treesitter/playground" }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use {
      "romgrk/nvim-treesitter-context",
      config = function()
        require("treesitter-context.config").setup { enable = true }
      end,
    }
    use {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup { enable = true }
      end,
    }

    -- Dashboard
    use {
      "mhinz/vim-startify", -- start screen
      config = function()
        require("config.startify").setup { enable = true }
      end,
    }

    -- Status line
    use {
      "glepnir/galaxyline.nvim",
      branch = "main",
      config = function()
        require("config.galaxyline").setup()
      end,
    }

    -- Development workflow
    use {
      "Pocco81/TrueZen.nvim",
      config = function()
        require("config.truezen").setup()
      end,
    }
    use { "editorconfig/editorconfig-vim" }
    use {"norcalli/nvim-colorizer.lua"}
    use { "caenrique/nvim-toggle-terminal" }
    use {"rbgrouleff/bclose.vim"}
    use {'francoiscabrol/ranger.vim'}

    -- Rust
    use { "rust-lang/rust.vim" }
    use { "simrat39/rust-tools.nvim" }

    -- TypeScript
    use { "jose-elias-alvarez/nvim-lsp-ts-utils" }

    -- Javascript
    use { "pangloss/vim-javascript" }
    use {"mogelbrod/vim-jsonpath"}

    -- Vimwiki
    use {"vimwiki/vimwiki"}
    use {"michal-h21/vim-zettel"}
    use {"masukomi/vim-markdown-folding"}


    -- Markdown
    use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }
    use { "plasticboy/vim-markdown" }

    -- Note taking
    use {
      'kristijanhusak/orgmode.nvim',
      config = function()
        require('orgmode').setup({
          org_agenda_files = {'~/Notes/*'},
          org_default_notes_file = '~/Notes/README.org',
        })
      end
    }
    --use {
    --  "vhyrro/neorg",
    --  config = function()
    --    require("config.neorg").setup()
    --  end,
    --  requires = "nvim-lua/plenary.nvim",
    --}

  end)
end

return M


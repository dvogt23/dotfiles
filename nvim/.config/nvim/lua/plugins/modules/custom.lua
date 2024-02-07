local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

return {
  -- { 'Bekaboo/dropbar.nvim' },
  -- {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async', },
  { 'christoomey/vim-tmux-navigator' },
  { 'akinsho/git-conflict.nvim',       version = "*",      config = true },
  { "JoosepAlviste/palenightfall.nvim" },
  { "folke/zen-mode.nvim",             event = "VeryLazy", config = true },
  { "phelipetls/jsonpath.nvim" },
  { 'nvim-telescope/telescope-ui-select.nvim', event = "VeryLazy" },
  -- {
  --   'stevearc/dressing.nvim',
  --   opts = {},
  -- },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
  },
  {
    "rest-nvim/rest.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("rest-nvim").setup({})
    end,
    keys = {
      keymap("n", "<leader>rr", "<Plug>RestNvim", { desc = "Run Rest.nvim" }),
    }
  },
  {
    'lukas-reineke/headlines.nvim',
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true, -- or `opts = {}`
  },
  -- { -- shade in-active windows
  --   "miversen33/sunglasses.nvim",
  --   config = function()
  --     require("sunglasses").setup({
  --       filter_type = "SHADE",
  --       filter_percent = .15
  --     })
  --   end,
  --   event = "UIEnter"
  -- },
  {
    'NeogitOrg/neogit',
    config = function()
      require("neogit").setup({
        integrations = {
          diffview = true,
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },
  {
    "nvim-lua/plenary.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "dpayne/CodeGPT.nvim",
    }
  },
  { "weizheheng/ror.nvim" },

  { "sindrets/diffview.nvim" },

  {
    "lewis6991/hover.nvim",
    event = "VeryLazy",
    config = function()
      require("hover").setup({
        init = function()
          -- Require providers
          require("hover.providers.lsp")
          require("hover.providers.gh")
          -- require('hover.providers.gh_user')
          -- require('hover.providers.jira')
          -- require('hover.providers.man')
          -- require('hover.providers.dictionary')
        end,
        preview_opts = {
          border = nil,
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
      })

      -- Setup keymaps
      vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
      vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
    end,
  },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "olimorris/neotest-rspec",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim",
  --   },
  --   config = function()
  --     require("neotest").setup({
  --       adapters = {
  --         require("neotest-plenary"),
  --         require("neotest-rspec")({
  --           rspec_cmd = function()
  --             return vim.tbl_flatten({
  --               "bundle",
  --               "exec",
  --               "rspec",
  --             })
  --           end,
  --         }),
  --       },
  --     })
  --   end,
  -- },
  { "folke/tokyonight.nvim" },
  { "tpope/vim-dispatch" },
  { "tpope/vim-fugitive",   event = "VeryLazy" },
  { "tpope/vim-commentary" },
  {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup({
        config = {
          fill_char = '.',
          matchup_patterns = {
            { '^%s*do$',       'end' }, -- do ... end blocks
            { '^%s*if',        'end' }, -- if ... end
            { '^%s*for',       'end' }, -- for
            { 'function%s*%(', 'end' }, -- 'function( or 'function (''
            { '{',             '}' },
            { '%(',            ')' },   -- % to escape lua pattern char
            { '%[',            ']' },   -- % to escape lua pattern char
          },
        }
      })
    end
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",       opts = {},    config = true },
  { "tpope/vim-rhubarb" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-vinegar" },
  { "tpope/vim-sleuth" },
  { "tpope/vim-rails" },
  { "thoughtbot/vim-rspec" },
  { "phelipetls/jsonpath.nvim" },

  { "dnlhc/glance.nvim" },
  { "freddiehaddad/feline.nvim" },
  { "mg979/vim-visual-multi" }, -- multi cursor
  { "norcalli/nvim-colorizer.lua",         event = "VeryLazy", config = true },

  {
    "vimwiki/vimwiki",
    config = function()
      require("custom.vimwiki").setup()
    end,
  },

  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    config = true,
  },

  {
    "nguyenvukhang/nvim-toggler",
    config = function()
      require("nvim-toggler").setup({
        -- your own inverses
        inverses = {
          ["min"] = "max",
          ["minimum"] = "maximum",
        },
        -- removes the default <leader>i keymap
        remove_default_keybinds = true,
      })
    end,
  },

  {
    "epwalsh/obsidian.nvim",
    config = function()
      require("obsidian").setup({
        dir = "$NOTES_DIR",
        completion = {
          nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        },
        daily_notes = {
          folder = "private/diary/2023",
          template = "dairy.md",
          alias_format = "%Y-%m-%d",
        },
        overwrite_mappings = true,
        templates = {
          subdir = "templates",
        },
      })
    end,
  },

  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    event = { "VeryLazy" },
    config = function()
      require("peek").setup({
        filetype = { 'markdown' },
      })
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
    keys = {
      {
        "<leader>op",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
    opts = { theme = "light" },
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = true,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "rbgrouleff/bclose.vim" },
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    event = "VeryLazy",
  },
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup()
    end,
  },

  { "joechrisellis/lsp-format-modifications.nvim" },

  { "rebelot/kanagawa.nvim" },
  {
    "declancm/cinnamon.nvim",
    config = function()
      require("cinnamon").setup({
        default_delay = 3,
      })
    end,
  },

  {
    "gen740/SmoothCursor.nvim",
    event = "VeryLazy",
    config = true,
  },
}

-- TODO:
-- - true zen
-- - commentary

return {
  { "JoosepAlviste/palenightfall.nvim" },
  { "folke/zen-mode.nvim", event = "VeryLazy", config = true },
  { "catppuccin/nvim", name = "catppuccin" },
  { "phelipetls/jsonpath.nvim" },
  {
    "TimUntersberger/neogit",
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
  { "weizheheng/ror.nvim" },

  { "folke/tokyonight.nvim" },
  { "tpope/vim-dispatch" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-surround" },
  { "tpope/vim-commentary" },
  { "tpope/vim-rhubarb" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-vinegar" },
  { "tpope/vim-sleuth" },
  { "tpope/vim-rails" },
  { "thoughtbot/vim-rspec" },
  { "phelipetls/jsonpath.nvim" },

  { "dnlhc/glance.nvim" },

  {
    "vimwiki/vimwiki",
    config = function()
      require("custom.vimwiki").setup()
    end,
  },

  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
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
          folder = "diary",
        },
      })
    end,
  },

  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
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
  { "sindrets/diffview.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "rbgrouleff/bclose.vim" },
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
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
    config = function()
      require("smoothcursor").setup({})
    end,
  },
}

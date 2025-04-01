local keymap = vim.keymap.set

return {
  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },
  -- { "supermaven-inc/supermaven-nvim", config = true, event = "VeryLazy" },
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },
  -- { "christoomey/vim-tmux-navigator" },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  { "JoosepAlviste/palenightfall.nvim" },
  { "folke/zen-mode.nvim", event = "VeryLazy", config = true },
  { "phelipetls/jsonpath.nvim" },
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require("nvim-tmux-navigation").setup({
        disable_when_zoomed = true,
      })
    end,
  },
  -- {
  --   "rest-nvim/rest.nvim",
  --   event = "VeryLazy",
  --   dependencies = "nvim-lua/plenary.nvim",
  --   config = function()
  --     require("rest-nvim").setup({})
  --   end,
  --   keys = {
  --     keymap("n", "<leader>rr", "<Plug>RestNvim", { desc = "Run Rest.nvim" }),
  --   },
  -- },
  {
    "NeogitOrg/neogit",
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
    "weizheheng/ror.nvim",
    keys = {
      { "<Leader>cr", ":lua require('ror.commands').list_commands()<CR>", desc = "Rails commands" },
    },
  },

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = true,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    event = "VeryLazy",
  },
  {
    "gen740/SmoothCursor.nvim",
    event = "VeryLazy",
    config = true,
  },
  { "tpope/vim-dispatch" },
  { "tpope/vim-fugitive", event = "VeryLazy" },
  { "thoughtbot/vim-rspec" },
  { "mg979/vim-visual-multi" }, -- multi cursor
  { "norcalli/nvim-colorizer.lua", event = "VeryLazy", config = true },
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
    -- keys = {
    --   "<leader>ct",
    --   require("nvim-toggler").toggle,
    --   { desc = "Toggle value" },
    -- },
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    event = { "VeryLazy" },
    config = function()
      require("peek").setup({
        filetype = { "markdown" },
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
    "epwalsh/obsidian.nvim",
    config = function()
      require("obsidian").setup({
        dir = "$NOTES_DIR",
        daily_notes = {
          folder = string.format("private/diary/%s", os.date("*t").year),
          template = "dairy.md",
          alias_format = "%Y-%m-%d",
        },
        templates = {
          subdir = "templates",
        },
        ui = {
          enable = true,
          hl_groups = {
            ObsidianHeader = { bg = "#75662e" },
          },
        },
      })
    end,
  },
}

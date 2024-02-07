-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return require("custom.lualine").setup()
        end,
      })
    end,
  },
  {"lukas-reineke/indent-blankline.nvim",
  opts = {
    show_trailing_blankline_indent = false,
    }
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        globalStatus = true,
      })
    end,
  },
  {"folke/tokyonight.nvim"},
  {"lewis6991/gitsigns.nvim",
    config = function()
    require('gitsigns').setup {
      current_line_blame = true,
      signs = {
        add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "_", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      },
    }
    end
  },

  {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "csa",
      delete = "csd",
      replace = "csr",
    },
  },
},

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "rcarriga/nvim-notify", enabled = false},
  { "ggandor/flit.nvim", enabled = false},
  { "nvim-lualine/lualine.nvim", enabled = false},
   { "folke/noice.nvim", enabled = false },
   { "ggandor/leap.nvim", enabled = false },
   { 's1n7ax/nvim-window-picker',
        config = function()
          require'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', "quickfix" },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
    },
--    { "nvim-neo-tree/neo-tree.nvim", enabled = false },
--   {
--   "nvim-neo-tree/neo-tree.nvim",
--   cmd = "Neotree",
--   keys = {
--     {
--       "<leader>fe",
--       function()
--         require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
--       end,
--       desc = "Explorer NeoTree (root dir)",
--     },
--     {
--       "<leader>fE",
--       function()
--         require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
--       end,
--       desc = "Explorer NeoTree (cwd)",
--     },
--     { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
--     { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
--   },
--   deactivate = function()
--     vim.cmd([[Neotree close]])
--   end,
--   init = function()
--     vim.g.neo_tree_remove_legacy_commands = 1
--     if vim.fn.argc() == 1 then
--       local stat = vim.loop.fs_stat(vim.fn.argv(0))
--       if stat and stat.type == "directory" then
--         require("neo-tree")
--       end
--     end
--   end,
--   opts = {
--     filesystem = {
--       bind_to_cwd = false,
--       follow_current_file = true,
--     },
--     window = {
--       mappings = {
--         ["<space>"] = "none",
--       },
--     },
--   },
-- },

  -- add symbols-outline
  -- {
  --   "simrat39/symbols-outline.nvim",
  --   cmd = "SymbolsOutline",
  --   keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
  --   config = true,
  -- },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      {
        "<leader>ns",
        function() require("telescope.builtin").find_files({ cwd = "$NOTES_DIR" }) end,
        desc = "Find notes",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        -- layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          }
        },
      },
    },
  },

  -- add telescope-fzf-native
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    -- apply the config and additionally load fzf-native
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        -- pyright = {},
        yamlls = {},
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    opts = {
      servers = {
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  -- { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}

return {
  -- comments
  -- { "JoosepAlviste/nvim-ts-context-commentstring",
  --   lazy = true,
  --   config = function(_, opts)
  --     require('ts_context_commentstring').setup {}
  --     -- vim.g.skip_ts_context_commentstring_module = true
  --   end,
  -- },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
}

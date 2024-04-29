local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local mappings = {
  m = {
    name = "+Markdown",
    p = { "<cmd>lua require('peek').open<CR>", "Open preview" },
    c = { "<cmd>lua require('peek').close<CR>", "Open preview" },
  },
}

which_key.register(mappings, opts)

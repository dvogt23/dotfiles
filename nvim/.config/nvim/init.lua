-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.functions")
require("config.keymaps")
require("config.options")
require("config.autocmds")
require("plugins")

-- vim.cmd([[colorscheme tokyonight-night]])
-- vim.cmd([[colorscheme catppuccin-mocha]])
vim.cmd([[colorscheme oxocarbon]])

vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]])

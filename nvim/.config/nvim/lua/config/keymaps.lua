-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

--vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
--vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

-- Mode switch
map("i", "jj", "<ESC>")
map({ "i", "v" }, "jk", "<ESC>")

-- Quits
map({ "i", "v", "n" }, "<C-s>", "<cmd>w!<CR>")
-- map({ "i", "v", "n" }, "<C-s>", "<cmd>noa w<CR>")

-- remove annoying exmode
map("n", "Q", "<Nop>", { noremap = true })
map("n", "q:", "<Nop>", { noremap = true })

-- Movements
map("i", "<C-H>", "<Esc>/<++><CR><Esc><Esc>cf>")
map("n", "j", "gj")
map("n", "k", "gk")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Move chars
map("n", "L", "xp", { noremap = true })
map("n", "H", "Xph", { noremap = true })

-- Better indenting
map("v", "<", "<gv")
map("n", "<", "<<")
map("n", ">", ">>")
map("v", ">", ">gv")

-- Utils
map("n", "<leader>fc", "<cmd>let @+ = expand('%:p')<CR>", { desc = "Filename (absolute) -> clipboard" })
map("v", ".", ":normal .<CR>")
map("n", "<ESC><ESC>", ":noh<CR>", {desc = "Escape highlight", silent = true})
map("n", "0", "^")
map("v", "$", "g_")
map("n", "$", "g_")
-- Move to the end of yanked text after yank and paste
map("n", "p", "p`]")
map("v", "y", "y`]")
map("v", "p", "p`]")

-- TODO: check this
-- map("n", "<Leader>js", "<C-W>v<C-]>")
-- map("n", "g{", [[m`o}<esc><lt><lt>kkA<Space>{<esc>``]])
-- map("n", "<leader>u", ":UndotreeToggle<CR>")
-- map("n", "g{", [[m`o}<esc><lt><lt>kkA<Space>{<esc>``]])
-- map("n", "za", [[@=(foldlevel('.')?'za':"\<Space>")<CR>]])
-- map("n", "zO", [[zCzO]])

-- Copy to system clipboard
-- map("v", "<C-c>", '"+y')
-- Paste from system clipboard with Ctrl + v
-- map("i", "<C-v>", '<Esc>"+p')

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map("o", "A", ":<C-U>normal! ggVG<CR>")

-- Inc-/Dec- rement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Split
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-H>", "<C-W><C-H>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-K>", "<C-W><C-K>")

-- Windows
map("n", "<A-Right>", "<C-W>5<")
map("n", "<A-Left>", "<C-W>5>")
map("n", "<A-Up>", "<C-W>+5")
map("n", "<A-Down>", "<C-W>-5")

-- LSP
-- map("n", "K", require("hover").hover, { desc = "hover.nvim" })
-- map("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
-- map({ 'n', 'v' }, '<leader>cl', require('nvim-toggler').toggle)

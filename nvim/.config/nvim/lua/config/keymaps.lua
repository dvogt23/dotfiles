-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set({ "i", "v" }, "jk", "<ESC>")
vim.keymap.set("n", "<leader>qa", "<cmd>qa!<CR>", { desc = "Quit all buffers" })

-- vim.keymap.set("n", "<C-p>", "<cmd>Telescope commands<CR>", { desc = "All Commands" })
vim.keymap.set("n", "<leader>j", "<cmd>HopChar1<CR>", { desc = "Jump [char]" })
vim.keymap.set("n", "<leader>fc", "<cmd>let @+ = expand('%:p')<CR>", { desc = "Filename (absolute) -> clipboard" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Grep in dir" })
vim.keymap.set({ "n", "v" }, "<leader>qw", "<cmd>qwa!<CR>", { desc = "Grep in dir" })

vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Sizing window
vim.keymap.set("n", "<A-Right>", "<C-W>5<")
vim.keymap.set("n", "<A-Left>", "<C-W>5>")
vim.keymap.set("n", "<A-Up>", "<C-W>+5")
vim.keymap.set("n", "<A-Down>", "<C-W>-5")

-- Move lines
vim.keymap.set("v", "K", "<cmd>m '<-2<cr>gv=gv")
vim.keymap.set("v", "J", "<cmd>m '>+1<cr>gv=gv")

-- Move chars
vim.keymap.set("n", "L", "xp", { noremap = true })
vim.keymap.set("n", "H", "Xph", { noremap = true })

-- Buffer
vim.keymap.set("n", "<leader>l", "<cmd>bnext<CR>", { desc = "Next (buffer)", noremap = true })
vim.keymap.set("n", "<leader>h", "<cmd>bprev<CR>", { desc = "Previous (buffer)", noremap = true })
vim.keymap.set("n", "<leader>bw", "<cmd>w!<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>bW", "<cmd>noa w!<CR>", { desc = "Write (no-format)" })
vim.keymap.set("n", "<leader>ba", "<cmd>Telescope buffers<CR>", { desc = "List all" })
vim.keymap.set("n", "<leader>bA", "<cmd>CloseHiddenBuffers<CR>", { desc = "Close all" })

-- Terminal
vim.keymap.set({ "n", "v", "i" }, "<C-p>", function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<C-p>", "<C-\\><C-n><CR>", { desc = "Enter Normal Mode" })

-- Git
vim.keymap.set("n", "<leader>gg", "<cmd>lua require'neogit'.open({commit})<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>ga", "<cmd>lua require'gitsigns'.stage_hunk()<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>gr", "<cmd>lua require'gitsigns'.reset_hunk()<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>gd", "<cmd>lua require'gitsigns'.preview_hunk()<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>gdd", "<cmd>DiffviewFileHistory<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>gdf", "<cmd>DiffviewFileHistory %<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>ghn", "<cmd>lua require'gitsigns'.next_hunk()<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>ghp", "<cmd>lua require'gitsigns'.prev_hunk()<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>gs", "<cmd>Gstatus<CR>", { desc = "git status" })
vim.keymap.set("n", "<leader>tgb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git blame" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Blame File" })
vim.keymap.set("n", "<leader>gcn", "<Plug>(git-conflict-next-conflict)", { desc = "git conflict next" })
vim.keymap.set("n", "<leader>gcp", "<Plug>(git-conflict-prev-conflict)", { desc = "git conflict previous" })
vim.keymap.set("n", "<leader>gco", "<Plug>(git-conflict-ours)", { desc = "git conflict Pick ours" })
vim.keymap.set("n", "<leader>gct", "<Plug>(git-conflict-theirs)", { desc = "git conflict Pick theirs" })
vim.keymap.set("n", "<leader>gl", "<cmd>Telescope git_commits<CR>", { desc = "Commits" })
vim.keymap.set("n", "<leader>glb", "<cmd>Telescope git_bcommits<CR>", { desc = "Commits (branch)" })

vim.keymap.set("n", "<leader>ni", "<cmd>e $NOTES_DIR/SUMMARY.md<CR>cd $NOTES_DIR", { desc = "notes index" })

vim.keymap.set("i", "<C-H>", "<Esc>/<++><CR><Esc><Esc>cf>")

vim.keymap.set("n", "<leader>F", "<cmd>ZenMode<CR>", { noremap = true, desc = "Focus" })

vim.keymap.set("n", "<BS>", "<C-^>", { desc = "last buffer" })

vim.keymap.set("v", ".", ":normal .<CR>")

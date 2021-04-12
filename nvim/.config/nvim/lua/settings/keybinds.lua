local map = require('settings.utils').map
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local opts = { noremap=true, silent=true }

-- Map <leader> to space
map("n", "<Space>", "<Nop>", { noremap = true})
g.mapleader = " "

map("n", "<leader>q", ":q!<CR>")
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")
map("n", "<ESC><ESC>", ":noh<CR>")

-- UI
map("n", "<leader>n", ":NvimTreeToggle<CR>") -- TODO
map("n", "<leader>f", ":Files<CR>")
map("n", "<leader>r", ":Rg<CR>", opts)
map("n", "<leader>t", ":ToggleTerminal<CR>", opts)
map("t", "<leader>t", "<C-\\><C-n>:ToggleTerminal<CR>", opts)
map("n", "<leader>c", ":Commands<CR>")

-- Split
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")

-- Sizing window
map("n", "<A-Right>", "<C-W>5<")
map("n", "<A-Left>", "<C-W>5>")
map("n", "<A-Up>", "<C-W>+5")
map("n", "<A-Down>", "<C-W>-5")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Move chars
map("n", "L", "xp", {noremap = true})
map("n", "H", "Xph", {noremap = true})

-- Buffer
map("n", "<leader>l", ":bnext<CR>")
map("n", "<leader>h", ":bprev<CR>")
map("n", "<leader>d", ":bd<CR>")
map("n", "<leader>w", ":w!<CR>")
map("n", "<leader>b", ":Buffers<CR>")
map("n", "<leader>dd", ":Bclose<CR>")
map("n", "<leader>da", ":CloseHiddenBuffers<CR>")

-- LSP
map("n", "gd", ":Definitions<CR>", opts)
map('n', "gD", ":Declarations<CR>", opts)
map("n", "gi", ":Implementations<CR>", opts)
map('n', "gr", ':References<CR>', opts)
map("n", "gt", ":TypeDefinitions<CR>", opts)
map("n", "<leader>sa", ":CodeActions<CR>")
map("v", "<leader>sa", ":lua lua vim.lsp.buf.range_code_action()<CR>")
map("n", "<leader>sf", ":lua vim.lsp.buf.formatting()<CR>", {})
map("v", "<leader>sf", ":lua vim.lsp.buf.range_formatting()<CR>")
map('n', '<leader>srn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<leader>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<leader>ss', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map('n', '<leader>sd', ':Diagnostics<CR>', opts)
map('n', '<leader>sdn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>sdp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)

-- Git
map("n", "<leader>ga", ":GitGutterStageHunk<CR>")
map("n", "<leader>gr", ":GitGutterUndoHunk<CR>")
map("n", "<leader>gd", ":GitGutterPreviewHunk<CR>")
map("n", "<leader>gs", ":Gstatus<CR>")
map("n", "<leader>gbb", ":GitBlameToggle<CR>")
map("n", "<leader>gcn", ":ConflictMarkerNextHunk<CR>")
map("n", "<leader>gcp", ":ConflictMarkerPrevHunk<CR>")
map("n", "<leader>gco", ":ConflictMarkerOurselves<CR>")
map("n", "<leader>gct", ":ConflictMarkerThemselves<CR>")
map("n", "<leader>gl", ":Commits<CR>")
map("n", "<leader>glf", ":GlLog<CR>")

-- Notes
map("n", "<leader>nn", ":call fzf#run({'options': '--reverse --prompt \"Notes >\"', 'down': 20, 'dir': '$NOTES_DIR', 'sink': 'e' })<CR>")
map("n", "<leader>ni", ":e $NOTES_DIR/SUMMARY.md<CR>cd $NOTES_DIR")

map("i", "<C-H>", "<Esc>/<++><CR><Esc><Esc>cf>")

map("n", "<leader>sc", ":CommentToggle<CR>", {noremap = true})
map("v", "<leader>sc", ":CommentToggle<CR>", {noremap = true})
map("n", "<leader>gg", ":Goyo<CR>", {noremap = true})

-- remove annoying exmode
map("n", "Q", "<Nop>", {noremap = true})
map("n", "q:", "<Nop>", {noremap = true})

-- Better indenting
map("v", "<", "<gv")
map("n", "<", "<<")
map("n", ">", ">>")
map("v", ">", ">gv")

-- Zero should go to the first non-blank character not to the first column (which could be blank)
map("n", "0", "^")
-- when going to the end of the line in visual mode ignore whitespace characters
map("v", "$", "g_")
map("n", "$", "g_")

map("n", "<leader>.", ":e $MYVIMRC<CR>")
map("n", "<leader>,", ":Startify<CR>")

map("n", "<BS>", "<C-^>")

map("v", ".", ":normal .<CR>")
map("x", "@", ":normal @<CR>")
map("n", "@", ":normal @<CR>")

-- map("n", "U", "~<Left>")
-- map("n", "<C-s>", ":noa w<CR>")

-- cmd "set wildcharm=<C-s>"
-- map("n", "<Tab><Tab>", ":buffer <C-s><S-Tab>")

-- map("n", "<leader>r", ":luafile %<CR>")
-- map("n", "<leader>x", ":lua reload()<CR>")

-- Copy to system clipboard
map("v", "<C-c>", '"+y')
-- Paste from system clipboard with Ctrl + v
map("i", "<C-v>", '<Esc>"+p')
-- Move to the end of yanked text after yank and paste
map("n", "p", "p`]")
map("v", "y", "y`]")
map("v", "p", "p`]")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map("o", "A", ":<C-U>normal! ggVG<CR>")
-- Disable ex mode mapping

map("n", "gJ", ":SplitjoinJoin<CR>")
map("n", "gj", ":SplitjoinSplit<CR>")
map("n", "g{", [[m`o}<esc><lt><lt>kkA<Space>{<esc>``]])

-- Jump to definition in vertical split
map("n", "<Leader>js", "<C-W>v<C-]>")

map("n", "<Leader>ap", "<Plug>(JsConsoleLog)", {noremap = false})
cmd [[nnoremap <silent><Plug>(JsConsoleLog) :lua console_log()<CR>]]

-- vim-import-js
map("n", "<Leader>if", ":ImportJSFix<CR>")
map("n", "<Leader>ii", ":ImportJSWord<CR>")
map("n", "<Leader>iw", ":ImportJSWord<CR>")

map("n", "<leader>u", ":UndotreeToggle<CR>")

--open a new file in the same directory
map("n", "<Leader>nf", [[:e <C-R>=expand("%:p:h") . "/" <CR>]], {silent = false})

map("n", "za", [[@=(foldlevel('.')?'za':"\<Space>")<CR>]])
map("n", "zO", [[zCzO]])

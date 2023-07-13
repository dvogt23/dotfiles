# NVIM ❤️

Will log my [keymap](#keymap)([file](./.config/nvim/lua/config/keymaps.lua)), some [defaults](#defaults)([file](./.config/nvim/lua/config/options.lua)), util [functions](./.config/nvim/lua/config/functions.lua), [autocmds](./.config/nvim/lua/config/autocmds.lua) and favorite [plugins](#plugins) here, for switching purpose betwenn different distributions of nvim.

## Keymap

This keymap format will be the [which-key]() format, of that favorite plugin.

```lua
-- Map <leader> to space
map("n", "<Space>", "<Nop>", { noremap = true })
g.mapleader = " "

-- Markdown Preview
vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

-- Mode switch
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set({ "i", "v" }, "jk", "<ESC>")

-- Quits
vim.keymap.set("n", "<leader>qq", "<cmd>q!<CR>", { desc = "Quit all buffers" })
vim.keymap.set("n", "<leader>wq", "<cmd>wq!<CR>", { desc = "Write/quit all buffers" })
vim.keymap.set({ "n", "v" }, "<leader>qw", "<cmd>qwa!<CR>", { desc = "Write/quit all buffers" })
vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>qW", "<cmd>noa w!<CR>", { desc = "Write (no-format)" })
vim.keymap.set("n", "<C-s>", ":noa w<CR>")
-- remove annoying exmode
vim.keymap.set("n", "Q", "<Nop>", { noremap = true })
vim.keymap.set("n", "q:", "<Nop>", { noremap = true })

-- Movements
vim.keymap.set("n", "<leader>j", "<cmd>HopChar1<CR>", { desc = "Jump [char]" })
vim.keymap.set("i", "<C-H>", "<Esc>/<++><CR><Esc><Esc>cf>")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Move lines
vim.keymap.set("v", "K", "<cmd>m '<-2<cr>gv=gv")
vim.keymap.set("v", "J", "<cmd>m '>+1<cr>gv=gv")
-- map("v", "J", ":m '>+1<CR>gv=gv")
-- map("v", "K", ":m '<-2<CR>gv=gv")

-- Move chars
vim.keymap.set("n", "L", "xp", { noremap = true })
vim.keymap.set("n", "H", "Xph", { noremap = true })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("v", ">", ">gv")

-- Utils
vim.keymap.set("n", "<leader>fc", "<cmd>let @+ = expand('%:p')<CR>", { desc = "Filename (absolute) -> clipboard" })
vim.keymap.set("v", ".", ":normal .<CR>")
vim.keymap.set("n", "<ESC><ESC>", ":noh<CR>", {desc = "Escape highlight"})
vim.keymap.set("n", "0", "^")
vim.keymap.set("v", "$", "g_")
vim.keymap.set("n", "$", "g_")
vim.keymap.set("n", "<leader>.", ":e $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>,", ":Startify<CR>")
-- Move to the end of yanked text after yank and paste
vim.keymap.set("n", "p", "p`]")
vim.keymap.set("v", "y", "y`]")
vim.keymap.set("v", "p", "p`]")

-- TODO: check this
-- vim.keymap.set("n", "<Leader>js", "<C-W>v<C-]>")
-- vim.keymap.set("n", "g{", [[m`o}<esc><lt><lt>kkA<Space>{<esc>``]])
-- vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
-- vim.keymap.set("n", "g{", [[m`o}<esc><lt><lt>kkA<Space>{<esc>``]])
-- vim.keymap.set("n", "za", [[@=(foldlevel('.')?'za':"\<Space>")<CR>]])
-- vim.keymap.set("n", "zO", [[zCzO]])

-- Copy to system clipboard
-- vim.keymap.set("v", "<C-c>", '"+y')
-- Paste from system clipboard with Ctrl + v
-- vim.keymap.set("i", "<C-v>", '<Esc>"+p')

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
vim.keymap.set("o", "A", ":<C-U>normal! ggVG<CR>")

-- Telescope
vim.keymap.set("n", "<C-p>", "<cmd>Telescope commands<CR>", { desc = "All Commands" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Grep in dir" })
vim.keymap.set("n", "<leader>ba", "<cmd>Telescope buffers<CR>", { desc = "List all" })
vim.keymap.set("n", "<leader>gl", "<cmd>Telescope git_commits<CR>", { desc = "Commits" })
vim.keymap.set("n", "<leader>glb", "<cmd>Telescope git_bcommits<CR>", { desc = "Commits (branch)" })

-- Inc-/Dec- rement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Split
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")

-- Windows
vim.keymap.set("n", "<A-Right>", "<C-W>5<")
vim.keymap.set("n", "<A-Left>", "<C-W>5>")
vim.keymap.set("n", "<A-Up>", "<C-W>+5")
vim.keymap.set("n", "<A-Down>", "<C-W>-5")

-- Focus
vim.keymap.set("n", "<leader>F", "<cmd>ZenMode<CR>", { noremap = true, desc = "Focus" })

-- Buffer
vim.keymap.set("n", "<leader>l", "<cmd>bnext<CR>", { desc = "Next (buffer)", noremap = true })
vim.keymap.set("n", "<leader>h", "<cmd>bprev<CR>", { desc = "Previous (buffer)", noremap = true })
vim.keymap.set("n", "<leader>bA", "<cmd>CloseHiddenBuffers<CR>", { desc = "Close all hidden buffers" })
vim.keymap.set("n", "<BS>", "<C-^>", { desc = "last buffer" })

-- Terminal
vim.keymap.set({ "n", "v", "i" }, "<C-`>", function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<C-`>", "<C-\\><C-n><CR>", { desc = "Enter Normal Mode" })

-- LSP
vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
vim.keymap.set("n", "<leader>srn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
vim.keymap.set("n", "gd", ":Definitions<CR>", opts)
vim.keymap.set("n", "gD", ":Declarations<CR>", opts)
vim.keymap.set("n", "gi", ":Implementations<CR>", opts)
vim.keymap.set("n", "gr", ":References<CR>", opts)
vim.keymap.set("n", "<leader>sa", ":CodeActions<CR>")
vim.keymap.set("v", "<leader>sa", ":RangeCodeActions<CR>")
-- vim.keymap.set({ 'n', 'v' }, '<leader>cl', require('nvim-toggler').toggle)
vim.keymap.set("n", "<leader>ss", ":lua vim.diagnostic.open_float()<CR>", opts)
vim.keymap.set("n", "<leader>sd", ":TroubleToggle<CR>", opts)
vim.keymap.set("n", "<leader>sdn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
vim.keymap.set("n", "<leader>sdp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)

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
vim.keymap.set("n", "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Git blame" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Blame File" })
vim.keymap.set("n", "<leader>gcn", "<Plug>(git-conflict-next-conflict)", { desc = "git conflict next" })
vim.keymap.set("n", "<leader>gcp", "<Plug>(git-conflict-prev-conflict)", { desc = "git conflict previous" })
vim.keymap.set("n", "<leader>gco", "<Plug>(git-conflict-ours)", { desc = "git conflict Pick ours" })
vim.keymap.set("n", "<leader>gct", "<Plug>(git-conflict-theirs)", { desc = "git conflict Pick theirs" })

vim.api.nvim_set_keymap("n", "<leader>gY", '<cmd>lua require"gitlinker".get_buf_range_url()<cr>', { silent = true })

-- Notes
vim.keymap.set("n", "<leader>ni", "<cmd>e $NOTES_DIR/SUMMARY.md<CR>cd $NOTES_DIR", { desc = "notes index" })
```

## Plugins

List of my favorite plugins for nvim, that Im using for my daily business (full-stack - rails & react). Im using [lazy]() plugin manager
actually, so will log this in that syntax.

```lua

  'tiagovla/tokyodark.nvim',
  "embark-theme/vim",
  "arcticicestudio/nord-vim",
  'Shatur95/neovim-ayu',
  "mlaursen/vim-react-snippets",
  "dsznajder/vscode-es7-javascript-react-snippets",
  {"vim-ruby/vim-ruby", ft = 'ruby'},
  {"tpope/vim-rake", ft = 'ruby'},
  "mbbill/undotree", -- undo tree
  "mbbill/undotree", -- undo tree
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "folke/lsp-trouble.nvim",
  'folke/lsp-colors.nvim',
  'folke/todo-comments.nvim',
    use { "tpope/vim-dispatch" }
    use { "tpope/vim-fugitive" }
    use { "tpope/vim-surround" }
    use { "tpope/vim-commentary" }
    use { "tpope/vim-rhubarb" }
    use { "tpope/vim-unimpaired" }
    use { "tpope/vim-vinegar" }
    use { "tpope/vim-sleuth" }
    use { "wellle/targets.vim" }
    use {
      'TimUntersberger/neogit',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require("neogit").setup {}
      end,
    }
    use {'akinsho/git-conflict.nvim', config = function()
      require('git-conflict').setup()
    end}
    use { "sindrets/diffview.nvim" }
    use { 'folke/tokyonight.nvim' }
    use{
      'petertriho/nvim-scrollbar',
      config = function()
        local colors = require("tokyonight.colors").setup()
        require("scrollbar").setup({
          handle = {
            color = colors.bg_highlight,
          },
          marks = {
            Search = { color = colors.orange },
            Error = { color = colors.error },
            Warn = { color = colors.warning },
            Info = { color = colors.info },
            Hint = { color = colors.hint },
            Misc = { color = colors.purple },
          }
        })        
      end,
    }
    use {
      "vimwiki/vimwiki",
      config = function()
        require('config.vimwiki').setup()
      end
    }
    -- use {"michal-h21/vim-zettel"}


    -- Markdown
    use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }
    use { "plasticboy/vim-markdown" }
    use {"masukomi/vim-markdown-folding"}
    use {"mogelbrod/vim-jsonpath"}
    use { "editorconfig/editorconfig-vim" }
    use {"norcalli/nvim-colorizer.lua"}
    use { "caenrique/nvim-toggle-terminal" }
    use {"rbgrouleff/bclose.vim"}
    use {'francoiscabrol/ranger.vim'}
```

## Defaults

A list of my usual config parameters for nvim.

```lua
local function apply_options(opts)
  for k, v in pairs(opts) do
    if v == true then
      vim.cmd("set " .. k)
    elseif v == false then
      vim.cmd(string.format("set no%s", k))
    else
      vim.cmd(string.format("set %s=%s", k, v))
    end
  end
end

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

vim.bo.shiftwidth = indent
vim.bo.tabstop = indent
vim.bo.softtabstop = indent
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.scrolloff = 8
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.timeoutlen = 500
vim.o.updatetime = 300
vim.o.inccommand = "split"
vim.o.cmdheight = 1
vim.o.sidescrolloff = 8
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
vim.o.history = 100
vim.o.lazyredraw = true
vim.o.synmaxcol = 240

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.scrolloff = 8
vim.wo.cursorline = true
vim.opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  - "r" -- Don't insert comment after <Enter>
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

vim.g.ultest_icons = 1
vim.g.dap_virtual_text = true
vim.g.dict = "/Users/void/.config/word10k.txt"
vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = "     <author> • <summary> • <date>"
vim.g.lengthmatters_highlight_one_column = 1
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/local/bin/python3"
vim.g.jsx_ext_required = 1
vim.g.javascript_plugin_flow = 1
vim.g.javascript_plugin_jsdoc = 1
vim.g.tagalong_additional_filetypes = { "javascript", "vue" }
vim.g.vim_matchtag_enable_by_default = 0
vim.g.vim_matchtag_both = 0
vim.g.vim_matchtag_files = "*.html,*.xml,*.js,*.jsx,*.vue,*.svelte,*.jsp"
vim.g.closetag_filetypes = "html,xhtml,phtml,html.handlebars,javascriptreact,typescriptreact,vue"
vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx,*.vue"
vim.g.closetag_emptyTags_caseSensitive = 1
vim.g.closetag_shortcut = ">"
vim.g.user_emmet_mode = "i"
vim.g.user_emmet_expandabbr_key = "<C-a><C-a>"
vim.g.user_emmet_install_global = 0
vim.g.user_emmet_install_command = 0
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.matchup_matchparen_timeout = 100
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_deferred_show_delay = 150
vim.g.matchup_matchparen_deferred_hide_delay = 700
vim.g.matchup_matchparen_hi_surround_always = 1
vim.g.matchup_matchparen_offscreen = { method = "popup", highlight = "CurrentWord" }
vim.g.matchup_delim_start_plaintext = 0
vim.g.matchup_motion_override_Npercent = 0
vim.g.matchup_motion_cursor_end = 0
vim.g.matchup_mappings_enabled = 0

apply_options({
  compatible = false,
  wildmenu = true,
  cindent = true,
  autoindent = true, -- enable autoindent
  smartcase = true, -- improve searching using '/'
  smartindent = true, -- smarter indentation
  smarttab = true, -- make tab behaviour smarter
  undofile = true,
  showcmd = false, -- disable mode display since lightline display
  showmatch = true, -- highlight matching [{()}]
  backup = false, -- disable backup
  cursorline = true, -- enable cursorline
  expandtab = true, -- use spaces instead of tabs
  autowrite = true, -- autowrite buffer when it's not focused
  hidden = true, -- keep hidden buffers
  hlsearch = true, -- highlight matching search
  ignorecase = true, -- case insensitive on search
  lazyredraw = true, -- lazyredraw to make macro faster
  list = false, -- display listchars
  number = true, -- enable number
  relativenumber = true, -- enable relativenumber
  showmode = false, -- don't show mode
  splitbelow = true, -- split below instead of above
  splitright = true, -- split right instead of left
  startofline = false, -- don't go to the start of the line when moving to another file
  swapfile = false, -- disable swapfile
  termguicolors = true, -- truecolours for better experience
  wrap = true,
  writebackup = false, -- disable backup
  wildignorecase = true,
  ttyfast = true,
  timeout = true,
  ttimeout = true,
  matchpairs = "(:),{:},[:],<:>", -- highlight match pairs
  omnifunc = "v:lua.vim.lsp.omnifunc",
  formatoptions = "1jcroql", -- improve editor formatting
  encoding = "UTF-8", -- set encoding
  fillchars = "vert:│,fold:·,diff:,msgsep:‾,eob:\\ ,foldopen:▾,foldsep:│,foldclose:▸,diff:╱", -- make vertical split sign better
  inccommand = "split", -- incrementally show result of command
  listchars = "tab:→\\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»",
  -- listchars = "eol:↲,tab:∘\\ ,trail:•", -- set listchars
  mouse = "nv", -- enable mouse support
  shortmess = "filnxtToOFIWc", -- disable some stuff on shortmess
  signcolumn = "yes", -- enable sign column all the time, 4 column
  clipboard = "unnamedplus", -- use system clipboard
  shell = "zsh",
  syntax = "on", -- syntax enable
  undodir = "/tmp/",
  wildignore = ".lock,.sass-cache,.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**",
  grepprg = "rg --hidden --glob '!.git' --no-heading --smart-case --vimgrep --follow $*",
  foldtext = "v:lua.folds_render()",
  foldmethod = "syntax",
  foldlevelstart = 99,
  laststatus = 3, -- always enable statusline
  pumheight = 20, -- limit completion items
  re = 0, -- set regexp engine to auto
  scrolloff = 8, -- make scrolling better
  sidescroll = 2, -- make scrolling better
  sidescrolloff = 15, -- make scrolling better
  synmaxcol = 500, -- set limit for syntax highlighting in a single line
  shiftwidth = 2, -- set indentation width
  tabstop = 2, -- tabsize
  softtabstop = 2,
  textwidth = 140,
  redrawtime = 10000,
  numberwidth = 1,
  timeoutlen = 300, -- faster timeout wait time
  updatetime = 100, -- set faster update time
  ttimeoutlen = 0,
})
```

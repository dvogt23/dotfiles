local opt = vim.opt
local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local indent = 4
local g = vim.g

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

cmd("syntax enable")
cmd("filetype plugin indent on")
cmd("set nofoldenable")

bo.shiftwidth = indent
bo.tabstop = indent
bo.softtabstop = indent
o.termguicolors = true
o.hidden = true
o.breakindent = true
o.ignorecase = true
o.scrolloff = 8
o.splitbelow = true
o.splitright = true
o.clipboard = "unnamed,unnamedplus"
o.timeoutlen = 500
o.updatetime = 300
o.inccommand = "split"
o.cmdheight = 1
o.sidescrolloff = 8
o.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
o.history = 100
-- o.lazyredraw = true
o.synmaxcol = 240

wo.number = true
wo.relativenumber = true
wo.scrolloff = 8
wo.cursorline = true
opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  - "r" -- Don't insert comment after <Enter>
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

g.mapleader = ' '
g.maplocalleader = ' '
g.ultest_icons = 1
g.dap_virtual_text = true
g.dict = "/Users/void/.config/word10k.txt"
g.gitblame_enabled = 0
g.gitblame_message_template = "     <author> • <summary> • <date>"
g.lengthmatters_highlight_one_column = 1
g.python_host_prog = "/usr/bin/python"
g.python3_host_prog = "/usr/local/bin/python3"
g.jsx_ext_required = 1
g.javascript_plugin_flow = 1
g.javascript_plugin_jsdoc = 1
g.tagalong_additional_filetypes = { "javascript", "vue" }
g.vim_matchtag_enable_by_default = 0
g.vim_matchtag_both = 0
g.vim_matchtag_files = "*.html,*.xml,*.js,*.jsx,*.vue,*.svelte,*.jsp"
g.closetag_filetypes = "html,xhtml,phtml,html.handlebars,javascriptreact,typescriptreact,vue"
g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx,*.vue"
g.closetag_emptyTags_caseSensitive = 1
g.closetag_shortcut = ">"
g.user_emmet_mode = "i"
g.user_emmet_expandabbr_key = "<C-a><C-a>"
g.user_emmet_install_global = 0
g.user_emmet_install_command = 0
g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_matchit = 1
g.loaded_2html_plugin = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.matchup_matchparen_timeout = 100
g.matchup_matchparen_deferred = 1
g.matchup_matchparen_deferred_show_delay = 150
g.matchup_matchparen_deferred_hide_delay = 700
g.matchup_matchparen_hi_surround_always = 1
g.matchup_matchparen_offscreen = { method = "popup", highlight = "CurrentWord" }
g.matchup_delim_start_plaintext = 0
g.matchup_motion_override_Npercent = 0
g.matchup_motion_cursor_end = 0
g.matchup_mappings_enabled = 0

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
  fillchars = "vert:│,fold:.,diff:,msgsep:‾,eob:\\ ,foldopen:▾,foldsep:│,foldclose:▸,diff:╱", -- make vertical split sign better
  -- fillchars = "vert:│,fold:·,diff:,msgsep:‾,eob:\\ ,foldopen:▾,foldsep:│,foldclose:▸,diff:╱", -- make vertical split sign better
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
  -- grepprg = "rg --hidden --glob '!.git' --no-heading --smart-case --vimgrep --follow $*",
  -- foldtext = "v:lua.folds_render()",
  -- foldmethod = "syntax",
  -- foldlevelstart = 99,
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
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


tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
{ key = {"<RightMouse>","<C-CR>", "<C-]>"},    cb = tree_cb("cd") },
--   ["<CR>"]           = tree_cb("edit"),
  -- ["<C-CR>"]          = tree_cb("cd"),
--   ["<C-v>"]          = tree_cb("vsplit"),
--   ["<C-x>"]          = tree_cb("split"),
--   ["<C-t>"]          = tree_cb("tabnew"),
--   ["<BS>"]           = tree_cb("close_node"),
--   ["<S-CR>"]         = tree_cb("close_node"),
--   ["<Tab>"]          = tree_cb("preview"),
--   ["I"]              = tree_cb("toggle_ignored"),
--   ["H"]              = tree_cb("toggle_dotfiles"),
--   ["R"]              = tree_cb("refresh"),
--   ["a"]              = tree_cb("create"),
--   ["d"]              = tree_cb("remove"),
--   ["r"]              = tree_cb("rename"),
--   ["<C-r>"]          = tree_cb("full_rename"),
--   ["x"]              = tree_cb("cut"),
--   ["c"]              = tree_cb("copy"),
--   ["p"]              = tree_cb("paste"),
--   ["-"]              = tree_cb("dir_up"),
--   ["q"]              = tree_cb("close"),
}

vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 30
vim.g.nvim_tree_ignore = {
  '.git', 'node_modules', 'dist', '.cache'
}
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_tab_open = 0
vim.g.nvim_tree_show_icons = {git = 0, folders = 1, files = 0}

vim.g.nvim_tree_icons = {
  symlink = '',

  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★"
  },

  -- folder = {default = "", open = " "}
  folder = {
   default = "",
   open = "",
   empty = "",
   empty_open = "",
   symlink = "",
   symlink_open = "",
  },
}

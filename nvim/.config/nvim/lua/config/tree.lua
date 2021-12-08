local M = {}

function M.setup()
    require'nvim-tree'.setup {
        disable_netrw       = true,
        hijack_netrw        = true,
        open_on_setup       = true,
        ignore_ft_on_setup  = {},
        auto_close          = true,
        open_on_tab         = false,
        hijack_cursor       = false,
        update_cwd          = false,
        update_to_buf_dir   = {
            enable = true,
            auto_open = true,
        },
        diagnostics = {
            enable = false,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            }
        },
        update_focused_file = {
            enable      = true,
            update_cwd  = false,
            ignore_list = { '.git', 'node_modules', '.cache' }
        },
        system_open = {
            cmd  = nil,
            args = {}
        },
        filters = {
            dotfiles = false,
            custom = {}
        },
        view = {
            width = 40,
            height = 30,
            hide_root_folder = false,
            side = 'left',
            auto_resize = true,
            mappings = {
                custom_only = false,
                list = {}
            }
        }
    }

    tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_side = 'left'
    vim.g.nvim_tree_width = 30
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_gitignore = 0
    vim.g.nvim_tree_git_hl = 0
    vim.g.nvim_tree_root_folder_modifier = ':~'
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

end

return M

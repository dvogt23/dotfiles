require('bufferline').setup{
  highlights = {
    buffer_selected = {
      guibg = normal_bg,
      guifg = '#080B0D',
    },
  },
  options = {
    modified_icon = '✥',
      buffer_close_icon = '',
      mappings = true,
      show_buffer_close_icons = false,
      show_close_icons = false,
      close_icon = '',
      always_show_bufferline = false,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or ""
        return " " .. icon .. count
      end,

    }
  }


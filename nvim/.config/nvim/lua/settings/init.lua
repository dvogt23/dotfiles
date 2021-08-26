require "settings.fold"
require "settings.packages"
require "settings.keybinds"
require "settings.autocmds"
require "settings.globals"
require "settings.options"

require('orgmode').setup({
  org_agenda_files = {'~/Notes/*'},
  org_default_notes_file = '~/Notes/README.org',
})

require("trouble").setup {}
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

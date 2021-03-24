local map = require('settings.utils').map
local sign_define = vim.fn.sign_define
local lsp = vim.lsp

lsp.handlers["textDocument/publishDiagnostics"] =
  lsp.with(
    lsp.diagnostic.on_publish_diagnostics,
    {
      underline = true,
      virtual_text = false,
      signs = true,
      update_in_insert = false
    }
  )

sign_define(
  "LspDiagnosticsSignError",
  {
    text = " ",
    texthl = "LspDiagnosticsError"
  }
)

sign_define(
  "LspDiagnosticsSignWarning",
  {
    text = " ",
    texthl = "LspDiagnosticsWarning"
  }
)

sign_define(
  "LspDiagnosticsSignInformation",
  {
    text = " ",
    texthl = "LspDiagnosticsInformation"
  }
)

sign_define(
  "LspDiagnosticsSignHint",
  {
    text = " ",
    texthl = "LspDiagnosticsHint"
  }
)

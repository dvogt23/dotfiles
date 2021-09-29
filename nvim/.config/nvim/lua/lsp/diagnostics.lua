local lspconfig = require "lspconfig"
local map = require('settings.utils').map
local sign_define = vim.fn.sign_define
local lsp = vim.lsp

local filetypes = {
    typescript = "eslint",
    typescriptreact = "eslint",
}

local linters = {
    eslint = {
        sourceName = "eslint",
        command = "eslint_d",
        rootPatterns = {".eslintrc.js", "package.json"},
        debounce = 100,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        parseJson = {
            errorsRoot = "[0].messages",
            line = "line",
            column = "column",
            endLine = "endLine",
            endColumn = "endColumn",
            message = "${message} [${ruleId}]",
            security = "severity"
        },
        securities = {[2] = "error", [1] = "warning"}
    },
    stylelint = {
      command = "./node_modules/.bin/stylelint",
      rootPatterns = {".git"},
      debounce = 100,
      args = {
        "--formatter",
        "json",
        "--stdin-filename",
        "%filepath"
      },
      sourceName = "stylelint",
      parseJson = {
        errorsRoot = "[0].warnings",
        line = "line",
        column = "column",
        message = "${text}",
        security = "severity"
      },
      securities = {
        error = "error",
        warning = "warning"
      }
    },
}

local formatters = {
    prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}},
    eslint = {
      command = "./node_modules/.bin/eslint",
      args = {"--fix-to-stduot", "--stdin", "%filepath"},
      rootPatterns = {
        "package.json"
      }
    },
}

local formatFiletypes = {
    javascript = "prettier",
    typescript = "prettier",
    typescriptreact = "prettier"
}

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

lspconfig.diagnosticls.setup(
  {
      on_attach = on_attach,
      filetypes = vim.tbl_keys(filetypes),
      init_options = {
          filetypes = {
            "markdown",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "javascript.jsx",
            "typescript.tsx",
            "css",
            "scss",
            "sass",
            "lua"
          },
          -- linters = linters,
          formatters = formatters,
          formatFiletypes = formatFiletypes
      }
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

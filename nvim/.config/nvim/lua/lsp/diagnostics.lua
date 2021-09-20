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
-- lspconfig.diagnosticls.setup(
--   {
--     filetypes = {
--       "markdown",
--       "javascript",
--       "typescript",
--       "javascriptreact",
--       "typescriptreact",
--       "javascript.jsx",
--       "typescript.tsx",
--       "css",
--       "scss",
--       "sass",
--       "lua"
--     },
--     init_options = {
--       linters = {
--         eslint = {
--           command = "./node_modules/.bin/eslint",
--           rootPatterns = {".git", "package.json"},
--           debounce = 100,
--           args = {
--             "--stdin",
--             "--stdin-filename",
--             "%filepath",
--             "--format",
--             "json"
--           },
--           sourceName = "eslint",
--           parseJson = {
--             errorsRoot = "[0].messages",
--             line = "line",
--             column = "column",
--             endLine = "endLine",
--             endColumn = "endColumn",
--             message = "${message} [${ruleId}]",
--             security = "severity"
--           },
--           securities = {
--             [2] = "error",
--             [1] = "warning"
--           }
--         },
--         stylelint = {
--           command = "./node_modules/.bin/stylelint",
--           rootPatterns = {".git"},
--           debounce = 100,
--           args = {
--             "--formatter",
--             "json",
--             "--stdin-filename",
--             "%filepath"
--           },
--           sourceName = "stylelint",
--           parseJson = {
--             errorsRoot = "[0].warnings",
--             line = "line",
--             column = "column",
--             message = "${text}",
--             security = "severity"
--           },
--           securities = {
--             error = "error",
--             warning = "warning"
--           }
--         },
--       },
--       filetypes = {
--         markdown = "markdownlint",
--         javascript = "eslint",
--         typescript = "eslint",
--         javascriptreact = "eslint",
--         typescriptreact = "eslint",
--         css = "stylelint",
--         scss = "stylelint",
--         sass = "stylelint",
--         fish = "fish"
--       },
--       formatters = {
--         eslint = {
--           command = "./node_modules/.bin/eslint",
--           args = {"--fix-to-stduot", "--stdin", "%filepath"},
--           rootPatterns = {
--             "package.json"
--           }
--         },
--         luafmt = {
--           command = "npx luafmt",
--           args = {"--indent-count", 2, "--stdin"}
--         },
--         prettier = {
--           -- args = {"--stdin-filepath", "%filepath", "--single-quote", "--print-width 120"},
--           command = "npm prettier",
--           -- args = {
--           --   "--stdin-filepath",
--           --   "%filepath",
--           --   "--single-quote",
--           --   "--print-width 120"
--           -- },
--           args = {
--             "--stdin-filepath",
--             vim.api.nvim_buf_get_name(0),
--             "--single-quote",
--             "--arrow-parens 'avoid'",
--             "--trailing-comma all"
--           },
--           rootPatterns = {
--             "package.json"
--           }
--         }
--       },
--       formatFiletypes = {
--         lua = "luafmt",
--         javascript = "prettier",
--         javascriptreact = "prettier",
--         typescript = "prettier",
--         typescriptreact = "prettier"
--       }
--     }
--   }
-- )

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

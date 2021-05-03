local lsp = vim.lsp
local lspconfig = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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
    typescript = "prettier",
    typescriptreact = "prettier"
}

local on_attach = function(client, server)
  -- require'completion'.on_attach(client)

  -- let efm server handles linting and formatting stuff
  if server == "efm" then
    client.resolved_capabilities.document_formatting = true
  else
    client.resolved_capabilities.document_formatting = false
  end

  print("'" .. client.name .. "' server attached")
end
-- lspconfig.tsserver.setup{on_attach = on_attach, capabilities = capabilities}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  formatFiletypes = formatFiletypes,
  formatters = formatters,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true
        }
      }
    }
  }
}

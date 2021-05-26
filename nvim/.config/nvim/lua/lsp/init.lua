-- bash        npm install -g bash-language-server
-- dockerfile  npm install -g dockerfile-language-server-nodejs
-- js, ts      npm install -g typescript typescript-language-server

local map = vim.api.nvim_set_keymap

require "lsp.compe"
require "lsp.ts"
require "lsp.html"
require "lsp.css"
require "lsp.json"
require "lsp.lua"
require "lsp.bash"
require "lsp.diagnostics"
-- require "lsp.saga"

-- LSP
--map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
--map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
--map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})

--map("n", "<leader>ff", ":lua vim.lsp.buf.formatting()<CR>", {})

-- vim.cmd('autocmd CursorHold   * lua vim.lsp.buf.document_highlight()')
-- vim.cmd('autocmd CursorHoldI  * lua vim.lsp.buf.document_highlight()')
-- vim.cmd('autocmd CursorMoved  * lua vim.lsp.buf.clear_references()')
-- vim.cmd('autocmd CursorMovedI * lua vim.lsp.buf.clear_references()')
-- vim.cmd('highlight LspReferenceText ctermbg=red guibg=red')
-- vim.cmd('highlight LspReferenceRead ctermbg=red guibg=red')
-- vim.cmd('highlight LspReferenceWrite ctermbg=red guibg=red')

vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then
    return
  end
  if not vim.bo[bufnr].modified then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then
      vim.cmd("noautocmd :update")
    end
  end
end

Custom_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

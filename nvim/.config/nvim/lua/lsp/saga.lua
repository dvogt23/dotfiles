local map = require('settings.utils').map
local saga = require "lspsaga"

local opts = {
  border_style = 2
}

saga.init_lsp_saga(opts)

--map("n", "gr", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", {noremap = true, silent = true})
--map("n", "gh", "<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>", {noremap = true, silent = true})
--map("n", "gp", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", {noremap = true, silent = true})
--map("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", {noremap = true, silent = true})
--
--map("n", "<leader>la", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {noremap = true, silent = true})
--map("n", "rn", "<cmd>lua  require('lspsaga.rename').rename()<CR>", {noremap = true, silent = true})
--map("n", "'d", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", {noremap = true, silent = true})
--map("n", "[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", {noremap = true, silent = true})
--map("n", "]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", {noremap = true, silent = true})


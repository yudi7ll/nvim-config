require('modules.nvim-lspconfig.lsp.emmet')
require('modules.nvim-lspconfig.lsp.lua')
require('modules.nvim-lspconfig.lsp.tailwindcss')
require('modules.nvim-lspconfig.lsp.tsserver')

vim.api.nvim_create_autocmd("CursorHold", {
  callback = require('lspsaga.diagnostic').show_line_diagnostics
})

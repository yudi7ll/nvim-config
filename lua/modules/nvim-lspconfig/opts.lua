local M = {}
local mappings = require("common.mappings")
local utils = require('common.utils')
local lsp_status = require("lsp-status")
local navic = require("nvim-navic")
local colorizer = require("colorizer")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

M.capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
M.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  mappings.setup_lsp_mapping(bufnr)
  utils.format_on_save(client, bufnr)
  utils.show_diagnostic_under_cursor(bufnr)
  utils.highlight_symbol_under_cursor(client, bufnr)
  lsp_status.on_attach(client)
  navic.attach(client, bufnr)
  colorizer.attach_to_buffer(bufnr)
end

return M
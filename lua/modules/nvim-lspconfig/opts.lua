local M = {}
local mappings = require("common.mappings")
local utils = require("common.utils")
local navic = require("nvim-navic")
local colorizer = require("colorizer")
local format = require("lib.format")

M.capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
M.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  format.on_attach(client)
  mappings.setup_lsp_mapping(bufnr)
  utils.show_diagnostic_under_cursor(bufnr)
  navic.attach(client, bufnr)
  colorizer.attach_to_buffer(bufnr)
end

return M

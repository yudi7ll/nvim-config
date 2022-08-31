local M = {}
local mappings = require("common.mappings")
local utils = require("common.utils")
local navic = require("nvim-navic")
local colorizer = require("colorizer")
local format = require("lib.format")
local lspconfig = require("lspconfig")
local global_capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

global_capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.util.default_config =
  vim.tbl_extend("force", lspconfig.util.default_config, {
    capabilities = global_capabilities,
  })

M.capabilities = global_capabilities
M.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  format.on_attach(client)
  mappings.setup_lsp_mapping(bufnr)
  utils.show_diagnostic_under_cursor(bufnr)
  navic.attach(client, bufnr)
  colorizer.attach_to_buffer(bufnr)
end

return M

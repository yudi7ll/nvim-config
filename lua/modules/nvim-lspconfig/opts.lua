local M = {}
local mappings = require("common.mappings")
local navic = require("nvim-navic")
local colorizer = require("colorizer")
local format = require("lib.format")
local lspconfig = require("lspconfig")
local highlight_symbol = require("lib.highlight-symbol")
local show_diagnostics = require("lib.show-diagnostics")
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

  format.attach(client)
  show_diagnostics.attach(bufnr)
  highlight_symbol.attach(client, bufnr)
  mappings.attach_mapping(bufnr)
  navic.attach(client, bufnr)
  colorizer.attach_to_buffer(bufnr)
end

return M

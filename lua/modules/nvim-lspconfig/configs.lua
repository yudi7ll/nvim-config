local M = {}
local mappings = require("common.mappings")
local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local colorizer = require("colorizer")
local format = require("lib.format")
local highlight_symbol = require("lib.highlight-symbol")
local cursor_diagnostics = require("lib.cursor-diagnostics")
local global_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.diagnostic.config({ virtual_text = false })

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
  capabilities = global_capabilities,
})

M.on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  format.attach(client)
  cursor_diagnostics.attach(bufnr)
  highlight_symbol.attach(client, bufnr)
  mappings.attach_mapping(bufnr)
  navic.attach(client, bufnr)
  colorizer.attach_to_buffer(bufnr)
end

return M

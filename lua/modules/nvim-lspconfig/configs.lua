local M = {}
local mappings = require("common.mappings")
local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local colorizer = require("colorizer")
local format = require("lib.format")
local cursor_diagnostics = require("lib.cursor-diagnostics")
local global_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.diagnostic.config({ virtual_text = false })

M.capabilities = vim.tbl_extend("force", lspconfig.util.default_config, {
  capabilities = global_capabilities,
})

lspconfig.util.default_config = M.capabilities

M.on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- format.attach(client)
  cursor_diagnostics.attach(bufnr)
  mappings.attach_mapping(bufnr)
  navic.attach(client, bufnr)
  colorizer.attach_to_buffer(bufnr)
end

return M

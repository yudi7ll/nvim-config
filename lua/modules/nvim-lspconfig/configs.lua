local M = {}
local mappings = require("common.mappings")
local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local colorizer = require("colorizer")
local format = require("lib.format")
local cursor_diagnostics = require("lib.cursor-diagnostics")

vim.diagnostic.config({ virtual_text = false })

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
  capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities(),
    require("lsp-file-operations").default_capabilities()
  ),
})

M.on_attach = function(client, bufnr)
  -- local function buf_set_option(...)
  --   vim.api.nvim_set_option_value(bufnr, ...)
  -- end

  -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  ---@diagnostic disable-next-line: undefined-field
  if _G.format_on_save then
    format.attach(client)
  end
  cursor_diagnostics.attach(bufnr)
  mappings.attach_mapping(bufnr)
  navic.attach(client, bufnr)
  colorizer.attach_to_buffer(bufnr)
end

return M

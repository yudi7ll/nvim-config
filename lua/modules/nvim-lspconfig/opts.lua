local M = {}
local lsp_status = require("lsp-status")
local navic = require("nvim-navic")
local colorizer = require("colorizer")
local keymaps = require("modules.nvim-lspconfig.keymaps")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local au_lsp_formatting = vim.api.nvim_create_augroup("LspFormatting", {})
-- local format_on_save = function(client, bufnr)
--   if client.supports_method("textDocument/formatting") then
--     vim.api.nvim_clear_autocmds({ group = au_lsp_formatting, buffer = bufnr })
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = au_lsp_formatting,
--       buffer = bufnr,
--       callback = function()
--         vim.lsp.buf.format({ bufnr = bufnr })
--       end,
--     })
--   end
-- end

vim.g.navic_silence = true

lsp_status.register_progress()

M.capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
M.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  lsp_status.on_attach(client)
  navic.attach(client, bufnr)
  colorizer.attach_to_buffer(bufnr)
  -- format_on_save(client, bufnr)
  keymaps.setup_keymaps(bufnr)
end

return M

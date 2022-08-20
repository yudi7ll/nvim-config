local M = {}
local utils = require("common.utils")
local nmap = utils.nmap
local vmap = utils.vmap

M.setup_keymaps = function(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  nmap("<leader>ar", require("cosmic-ui").rename, bufopts)
  nmap("<leader>ac", require("cosmic-ui").code_actions, bufopts)
  vmap("<leader>ac", require("cosmic-ui").range_code_actions, bufopts)
  nmap("<leader>af", vim.lsp.buf.format, bufopts)
  nmap("<leader>aF", vim.lsp.buf.formatting, bufopts)
  nmap("gd", vim.lsp.buf.definition, bufopts)
  nmap("gD", vim.lsp.buf.declaration, bufopts)
  nmap("gr", vim.lsp.buf.references, bufopts)
  nmap("gt", vim.lsp.buf.type_definition, bufopts)
  nmap("gi", vim.lsp.buf.implementation, bufopts)
  nmap("gs", vim.lsp.buf.document_symbol, bufopts)
  nmap("gw", vim.lsp.buf.workspace_symbol, bufopts)
  nmap("gn", vim.diagnostic.goto_next, bufopts)
  nmap("gN", vim.diagnostic.goto_prev, bufopts)
  nmap("K", vim.lsp.buf.hover, bufopts)
  nmap("H", vim.lsp.buf.signature_help, bufopts)
  nmap("<leader>lr", "<CMD>LspRestart<CR>", bufopts)
end

return M

local M = {}
local cosmic_ui = require("cosmic-ui")
local utils = require("common.utils")
local nmap = utils.nmap
local vmap = utils.vmap

-- Global mapping
nmap("<localleader>h", "<CMD>noh<CR>")
nmap("<F5>", "<CMD>PackerSync<CR>")
nmap("q:", "<CMD>q")
nmap("<leader>ls", ":LspSettings local ", { silent = false })
nmap("<leader>lS", ":LspSettings ", { silent = false })

-- lsp mapping
M.attach_mapping = function(bufnr)
  local bufopts = { buffer = bufnr }

  nmap("<leader>ar", cosmic_ui.rename, bufopts)
  nmap("<leader>ac", cosmic_ui.code_actions, bufopts)
  vmap("<leader>ac", cosmic_ui.range_code_actions, bufopts)
  nmap("<leader>af", vim.lsp.buf.format, bufopts)
  nmap("<leader>aF", vim.lsp.buf.formatting, bufopts)
  nmap("gd", vim.lsp.buf.definition, bufopts)
  nmap("gD", vim.lsp.buf.declaration, bufopts)
  nmap("gr", vim.lsp.buf.references, bufopts)
  nmap("gy", vim.lsp.buf.type_definition, bufopts)
  nmap("gi", vim.lsp.buf.implementation, bufopts)
  nmap("gs", vim.lsp.buf.document_symbol, bufopts)
  nmap("gw", vim.lsp.buf.workspace_symbol, bufopts)
  nmap("gn", vim.diagnostic.goto_next, bufopts)
  nmap("gN", vim.diagnostic.goto_prev, bufopts)
  nmap("K", vim.lsp.buf.hover, bufopts)
  nmap("H", vim.lsp.buf.signature_help, bufopts)
  nmap("<leader>lr", "<CMD>LspRestart<CR>", bufopts)
  nmap("<leader>lt", "<CMD>ToggleDiag<CR>", bufopts)
end

return M

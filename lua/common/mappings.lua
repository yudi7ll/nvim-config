local M = {}
local cosmic_ui = require("cosmic-ui")
local utils = require("common.utils")
local toggle_diagnostics = require("lib.toggle-diagnostics")
local format = require("lib.format").format
local nmap = utils.nmap
local vmap = utils.vmap
local xmap = utils.xmap
local tmap = utils.tmap
local formatting = function()
  vim.lsp.buf.format({ async = true })
end

-- Global mapping
nmap("<localleader>h", "<CMD>noh<CR>")
nmap("<leader>ll", "<CMD>Lazy<CR>")
nmap("<F5>", "<CMD>execute 'Lazy sync | TSUpdate'<CR>")
nmap("q:", "<CMD>q")
nmap("<leader>ls", ":LspSettings local ", { silent = false })
nmap("<leader>lS", ":LspSettings ", { silent = false })
nmap("<leader>k", "<CMD>w<CR>")
xmap("<leader>p", '"_dP')
tmap("<S-Space>", "<Space>", { silent = true })

-- lsp mapping
M.attach_mapping = function(bufnr)
  local bufopts = { buffer = bufnr }

  nmap("<leader>ar", cosmic_ui.rename, bufopts)
  nmap("<leader>ac", cosmic_ui.code_actions, bufopts)
  vmap("<leader>ac", cosmic_ui.range_code_actions, bufopts)
  nmap("<leader>af", format, bufopts)
  nmap("<leader>aF", formatting, bufopts)
  nmap("gd", vim.lsp.buf.definition, bufopts)
  nmap("gD", vim.lsp.buf.declaration, bufopts)
  nmap("gr", vim.lsp.buf.references, bufopts)
  nmap("gy", vim.lsp.buf.type_definition, bufopts)
  nmap("gi", vim.lsp.buf.implementation, bufopts)
  nmap("gs", vim.lsp.buf.document_symbol, bufopts)
  nmap("gw", vim.lsp.buf.workspace_symbol, bufopts)
  nmap("gn", vim.diagnostic.goto_next, bufopts)
  nmap("gN", vim.diagnostic.goto_prev, bufopts)
  -- nmap("K", vim.lsp.buf.hover, bufopts)
  nmap("H", vim.lsp.buf.signature_help, bufopts)
  nmap("<leader>lr", "<CMD>LspRestart<CR>", bufopts)
  nmap("<leader>lt", toggle_diagnostics.toggle)
end

return M

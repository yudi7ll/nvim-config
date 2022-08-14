local saga = require('lspsaga')
local utils = require('common.utils')
local nmap = utils.nmap

saga.init_lsp_saga();

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opts = { noremap = true, silent = true }
nmap('H', ':Lspsaga signature_help<CR>', opts)
nmap('K', ':Lspsaga hover_doc<CR>', opts)
nmap('gn', ':Lspsaga diagnostic_jump_next<CR>', opts)
nmap('gN', ':Lspsaga diagnostic_jump_prev<CR>', opts)
nmap('gd', ':Lspsaga lsp_finder<CR>', opts)
nmap('gr', ':Lspsaga preview_definition<CR>', opts)
nmap('<leader>ar', ':Lspsaga rename<CR>', opts)
nmap('<leader>ac', ':Lspsaga code_action<CR>', opts)

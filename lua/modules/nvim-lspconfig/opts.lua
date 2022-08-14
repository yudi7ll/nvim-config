local utils = require('common.utils')
local nmap = utils.nmap
local opts = {}

opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
opts.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nmap('gt', vim.lsp.buf.type_definition, bufopts)
  nmap('gi', vim.lsp.buf.implementation, bufopts)
  nmap('<space>ca', vim.lsp.buf.code_action, bufopts)
  nmap('<space>f', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
end

return opts

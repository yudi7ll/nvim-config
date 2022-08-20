local lspconfig = require('lspconfig')
local opts = require('modules.nvim-lspconfig.opts')

lspconfig.jsonls.setup(opts)

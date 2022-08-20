local lspconfig = require('lspconfig')
local opts = require('modules.nvim-lspconfig.opts')

lspconfig.eslint.setup(opts)

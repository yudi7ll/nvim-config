local lspconfig = require('lspconfig')
local utils = require('common.utils')
local opts = utils.merge(require('modules.nvim-lspconfig.opts'))

lspconfig.tsserver.setup(opts {})

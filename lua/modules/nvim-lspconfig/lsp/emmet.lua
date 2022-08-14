local lspconfig = require('lspconfig')
local utils = require('common.utils')
local opts = utils.merge(require('modules.nvim-lspconfig.opts'))

lspconfig.emmet_ls.setup(opts {
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})

local lspconfig = require('lspconfig')
local opts = require('modules.nvim-lspconfig.opts')

lspconfig.emmet_ls.setup(vim.tbl_extend("force", opts, {
  init_options = {
    html = {
      ["bem.enabled"] = true
    }
  }
}))

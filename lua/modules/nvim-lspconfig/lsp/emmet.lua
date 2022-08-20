local lspconfig = require("lspconfig")
local opts = require("modules.nvim-lspconfig.opts")

lspconfig.emmet_ls.setup(vim.tbl_extend("force", opts, {
  -- filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  filetypes = { "html" },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  },
}))

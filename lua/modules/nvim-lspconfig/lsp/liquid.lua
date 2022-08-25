local lspconfig = require("lspconfig")
local opts = require("modules.nvim-lspconfig.opts")

lspconfig.theme_check.setup(vim.tbl_extend("force", opts, {
  root_dir = function()
    return vim.loop.cwd()
  end
}))

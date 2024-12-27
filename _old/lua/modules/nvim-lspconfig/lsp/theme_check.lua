-- shopify theme check
local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")

lspconfig.theme_check.setup(vim.tbl_deep_extend("force", configs, {
  root_dir = function()
    return vim.loop.cwd()
  end,
}))

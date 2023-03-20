local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")

lspconfig.intelephense.setup(vim.tbl_deep_extend("force", configs, {
  filetypes = { "php", "blade" },
}))

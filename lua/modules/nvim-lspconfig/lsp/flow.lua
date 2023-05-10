local lspconfig = require("lspconfig")
local lspconfig_configs = require("lspconfig.configs")
local configs = require("modules.nvim-lspconfig.configs")

lspconfig_configs.flow = {
  default_config = {
    cmd = { "npx", "--no-install", "flow", "lsp" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
    root_dir = [[root_pattern(".flowconfig")]],
  },
}

lspconfig.blade.setup(vim.tbl_deep_extend("force", configs, {}))

local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")

lspconfig.tsserver.setup(vim.tbl_deep_extend("force", configs, {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  init_options = {
    hostinfo = "neovim",
  },
  compilerOptions = {
    module = "commonjs",
    target = "es6",
    allowJs = true,
    checkJs = true,
  },
  exclude = {
    "node_modules",
  },
}))

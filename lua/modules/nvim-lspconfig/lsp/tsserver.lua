local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")

lspconfig.tsserver.setup(vim.tbl_deep_extend("force", configs, {
  root_dir = function(fname)
    return lspconfig.util.root_pattern("jsconfig.json", "tsconfig.json")(fname)
      or not lspconfig.util.root_pattern(".flowconfig")(fname)
        and lspconfig.util.root_pattern("package.json", ".git")(fname)
  end,
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
    checkJs = false,
  },
  exclude = {
    "node_modules",
    "lib",
  },
}))

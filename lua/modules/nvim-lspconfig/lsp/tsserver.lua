local lspconfig = require("lspconfig")
local opts = require("modules.nvim-lspconfig.opts")

lspconfig.tsserver.setup(vim.tbl_deep_extend("force", opts, {
  on_attach = function(client, bufnr)
    opts.on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  compilerOptions = {
    module = "commonjs",
    target = "es6",
    checkJs = false,
  },
  exclude = {
    "node_modules",
  },
}))

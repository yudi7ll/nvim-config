local lspconfig = require("lspconfig")
local opts = require("modules.nvim-lspconfig.opts")
local luadev = require("lua-dev").setup()

lspconfig.eslint.setup(vim.tbl_deep_extend("force", opts, luadev, {
  on_attach = function(client, bufnr)
    opts.on_attach(client, bufnr)
    -- use eslint_d for formatting instead
    client.server_capabilities.documentFormattingProvider = false
  end,
}))

local lsp_configs = require("modules.nvim-lspconfig.configs")

require("flutter-tools").setup({
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = true, -- highlight the background
      foreground = false, -- highlight the foreground
      virtual_text = false, -- show the highlight using virtual text
    },
    on_attach = lsp_configs.on_attach,
    capabilities = lsp_configs.capabilities,
  },
})

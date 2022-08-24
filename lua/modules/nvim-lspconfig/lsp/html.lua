local lspconfig = require("lspconfig")
local opts = require("modules.nvim-lspconfig.opts")

lspconfig.html.setup(vim.tbl_extend("force", opts, {
  init_options = {
    filetypes = { "html", "php", "javascriptreact", "blade" },
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
}))

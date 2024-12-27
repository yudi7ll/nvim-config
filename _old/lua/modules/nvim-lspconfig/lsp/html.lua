local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")

lspconfig.html.setup(vim.tbl_deep_extend("force", configs, {
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

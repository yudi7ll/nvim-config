local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")

lspconfig.yamlls.setup(vim.tbl_deep_extend("force", configs, {
  settings = {
    yaml = {
      schemas = vim.list_extend({}, require("schemastore").json.schemas({})),
    },
  },
}))

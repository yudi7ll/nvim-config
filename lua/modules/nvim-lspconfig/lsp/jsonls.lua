local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")
local defaultSchemas = vim.list_extend(
  require("schemastore").json.schemas({}),
  require("nlspsettings").get_default_schemas()
)

lspconfig.jsonls.setup(vim.tbl_deep_extend("force", configs, {
  settings = {
    json = {
      schemas = vim.list_extend({
        {
          description = ".luarc.json schema",
          fileMatch = { ".luarc.json" },
          name = ".luarc.json",
          url = "https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json",
        },
      }, defaultSchemas),
      validate = { enable = true },
    },
  },
}))

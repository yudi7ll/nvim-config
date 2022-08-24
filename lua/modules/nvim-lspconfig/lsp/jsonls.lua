local lspconfig = require("lspconfig")
local opts = require("modules.nvim-lspconfig.opts")

lspconfig.jsonls.setup(vim.tbl_extend("force", opts, {
  settings = {
    json = {
      schemas = vim.list_extend({
        {
          description = ".luarc.json schema",
          fileMatch = { ".luarc.json" },
          name = ".luarc.json",
          url = "https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json",
        },
      }, require("schemastore").json.schemas({})),
      validate = { enable = true },
    },
  },
}))

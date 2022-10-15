local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")
require("neodev").setup({})

lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", configs, {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false },
    },
  },
}))

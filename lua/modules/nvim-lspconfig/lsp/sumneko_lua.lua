local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")
require("neodev").setup({})

lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", configs, {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      completion = {
        callSnippet = "Replace",
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false },
    },
  },
}))

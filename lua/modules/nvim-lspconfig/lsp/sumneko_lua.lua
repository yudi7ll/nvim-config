local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")
local luadev = require("lua-dev").setup()

lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", configs, luadev, {
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

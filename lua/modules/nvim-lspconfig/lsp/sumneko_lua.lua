local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")
local luadev = require("lua-dev").setup()

lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", configs, luadev, {
  on_attach = function(client, bufnr)
    configs.on_attach(client, bufnr)
    -- use stylua for formatting instead
    client.server_capabilities.documentFormattingProvider = false
  end,
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

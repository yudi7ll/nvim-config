local lspconfig = require("lspconfig")
local opts = require("modules.nvim-lspconfig.opts")
local luadev = require("lua-dev").setup()

lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", opts, luadev, {
  on_attach = function(client, bufnr)
    opts.on_attach(client, bufnr)
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

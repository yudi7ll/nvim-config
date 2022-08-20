local lspconfig = require('lspconfig')
local opts = require('modules.nvim-lspconfig.opts')
local luadev = require('lua-dev').setup()

lspconfig.sumneko_lua.setup(vim.tbl_extend("force", luadev, opts, {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false }
    }
  }
}))

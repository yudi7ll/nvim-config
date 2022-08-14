local lspconfig = require('lspconfig')
local utils = require('common.utils')
local opts = utils.merge(require('modules.nvim-lspconfig.opts'))

lspconfig.sumneko_lua.setup(opts {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false }
    }
  }
})

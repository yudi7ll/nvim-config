---@type LazySpec
return {
  "williamboman/mason.nvim",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      opts = function()
        local mason_lspconfig = require "mason-lspconfig"

        mason_lspconfig.setup_handlers {
          function(server_name)
            local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
            local opts = {}
            if require_ok then
              opts = vim.tbl_deep_extend("force", server, {})
            end

            require("lspconfig")[server_name].setup(opts)
          end
        }

        return {
          ensure_installed = {
            "html",
            "cssls",
            "cssmodules_ls",
            "intelephense",
            "dockerls",
            "lua_ls",
            "tailwindcss",
            "yamlls",
            "jsonls",
            "vimls",
            "prismals",
            "taplo",
            "eslint",
          },
          automatic_installation = true,

        }
      end
    }
  },
  event = "BufReadPost",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonInstallAll",
    "MasonUpdate",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
  },
  keys = {
    {'<leader>m', '<cmd> Mason <cr>', desc = "Mason"}
  },
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  }
}

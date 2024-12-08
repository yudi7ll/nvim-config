---@type LazySpec
return {
  "williamboman/mason.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
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
    { "<leader>lm", "<cmd> Mason <cr>", desc = "Mason" },
  },
  opts = {
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
  config = function(_, opts)
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local mason_tool_installer = require "mason-tool-installer"
    local server_opts = {
      on_init = require("plugins.lsp.configs.server-opts").on_init,
      on_attach = require("plugins.lsp.configs.server-opts").on_attach,
      capabilities = require("plugins.lsp.configs.server-opts").capabilities(),
    }

    mason.setup(opts)

    mason_lspconfig.setup {
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
        "vtsls",
      },
      automatic_installation = true,
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
        if require_ok then
          server_opts = vim.tbl_deep_extend("force", server, server_opts)
        end

        require("lspconfig")[server_name].setup(server_opts)
      end,
    }

    mason_tool_installer.setup {
      ensure_installed = {
        "prettierd",
        "eslint_d",
        "stylua",
      },
      auto_update = true,
      run_on_start = true,
    }
  end,
}

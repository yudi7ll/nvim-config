local lspconfig = require("lspconfig")
local lspconfig_configs = require("lspconfig.configs")
local configs = require("modules.nvim-lspconfig.configs")

lspconfig_configs.blade = {
  default_config = {
    cmd = { vim.fn.getenv("HOME") .. "/.config/nvim/bin/laravel-dev-tools", "lsp" },
    filetypes = { "blade", "php" },
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname)
    end,
    settings = {},
  },
}

lspconfig.blade.setup(vim.tbl_deep_extend("force", configs, {}))

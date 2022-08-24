local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local opts = require("modules.nvim-lspconfig.opts")
local nmap = require("common.utils").nmap

nmap("<leader>m", "<CMD>Mason<CR>", { noremap = true, silent = true, nowait = true })

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = {
    "editorconfig_checker",
    "tsserver",
    "html",
    "css",
    "intelephense",
    "dockerls",
    "sumneko_lua",
    "tailwindcss",
    "yamlls",
    "prettierd",
    "eslint",
    "jsonls",
    "vimls",
    "prismals",
  },
  automatic_installation = true,
})

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup(opts)
  end,
})

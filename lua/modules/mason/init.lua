local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local nmap = require("common.utils").nmap

nmap("<leader>m", "<CMD>Mason<CR>", { nowait = true })

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
    "tsserver",
    "html",
    "cssls",
    "cssmodules_ls",
    "intelephense",
    "dockerls",
    "sumneko_lua",
    "tailwindcss",
    "yamlls",
    "jsonls",
    "vimls",
    "prismals",
    "taplo",
    "eslint",
  },
  automatic_installation = true,
})

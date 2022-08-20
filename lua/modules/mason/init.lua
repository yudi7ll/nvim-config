local nmap = require("common.utils").nmap

nmap("<leader>m", "<CMD>Mason<CR>", { noremap = true, silent = true, nowait = true })

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "tsserver",
    "eslint",
    "html",
    "css",
    "emmet_ls",
    "intelephense",
    "dockerls",
    "sumneko_lua",
    "stylua",
    "tailwindcss",
    "yamlls",
    "eslint",
    "prettierd",
    "emmet_ls",
    "jsonls",
    "vimls",
    "prismals",
  },
  automatic_installation = false,
})

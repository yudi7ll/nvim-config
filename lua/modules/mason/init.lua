local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local opts = require("modules.nvim-lspconfig.opts")
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
    "css",
    "intelephense",
    "dockerls",
    "sumneko_lua",
    "stylua",
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

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup(opts)
  end,
})

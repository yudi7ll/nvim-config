local nmap = require('common.utils').nmap

nmap("<leader>m", ":Mason<CR>", { noremap = true, silent = true, nowait = true })

require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'emmet_ls' },
  automatic_installation = true,
})

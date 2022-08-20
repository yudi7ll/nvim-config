local nmap = require('common.utils').nmap

require("modules.nvim-lspconfig.lsp.css")
require("modules.nvim-lspconfig.lsp.dockerfile")
require("modules.nvim-lspconfig.lsp.eslint")
require("modules.nvim-lspconfig.lsp.html")
require("modules.nvim-lspconfig.lsp.intelephense")
require("modules.nvim-lspconfig.lsp.omnisharp")
require("modules.nvim-lspconfig.lsp.json")
require("modules.nvim-lspconfig.lsp.lua")
require("modules.nvim-lspconfig.lsp.prisma")
require("modules.nvim-lspconfig.lsp.tailwindcss")
require("modules.nvim-lspconfig.lsp.tsserver")
require("modules.nvim-lspconfig.lsp.yaml")

nmap("<leader>li", "<CMD>LspInfo<CR>")

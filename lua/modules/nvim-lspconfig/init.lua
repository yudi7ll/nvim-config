local nmap = require("common.utils").nmap

require("modules.nvim-lspconfig.lsp.html")
require("modules.nvim-lspconfig.lsp.jsonls")
require("modules.nvim-lspconfig.lsp.lua")
require("modules.nvim-lspconfig.lsp.tailwindcss")
require("modules.nvim-lspconfig.lsp.tsserver")

nmap("<leader>li", "<CMD>LspInfo<CR>")

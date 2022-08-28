local nmap = require("common.utils").nmap

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- require("modules.nvim-lspconfig.lsp.eslint")
require("modules.nvim-lspconfig.lsp.html")
require("modules.nvim-lspconfig.lsp.jsonls")
require("modules.nvim-lspconfig.lsp.liquid")
require("modules.nvim-lspconfig.lsp.lua")
require("modules.nvim-lspconfig.lsp.tailwindcss")
require("modules.nvim-lspconfig.lsp.tsserver")

nmap("<leader>li", "<CMD>LspInfo<CR>")

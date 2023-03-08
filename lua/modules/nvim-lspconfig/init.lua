local nmap = require("common.utils").nmap
local mason_lspconfig = require("mason-lspconfig")
local configs = require("modules.nvim-lspconfig.configs")

local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

nmap("<leader>li", "<CMD>LspInfo<CR>")

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup(vim.fn.deepcopy(configs))
  end,
})

require("modules.nvim-lspconfig.lsp.blade")
require("modules.nvim-lspconfig.lsp.html")
require("modules.nvim-lspconfig.lsp.jsonls")
require("modules.nvim-lspconfig.lsp.lua_ls")
require("modules.nvim-lspconfig.lsp.tailwindcss")
require("modules.nvim-lspconfig.lsp.theme_check")
require("modules.nvim-lspconfig.lsp.tsserver")
require("modules.nvim-lspconfig.lsp.yamlls")

local utils = require("common.utils")
local nmap = utils.nmap
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

nmap("<leader>ni", "<CMD>NullLsInfo<CR>")
nmap("<leader>nl", "<CMD>NullLsLog<CR>")

null_ls.setup({
  sources = {
    formatting.eslint_d,
    formatting.blade_formatter,
    formatting.stylua,
    diagnostics.phpstan.with({ prefer_local = "./vendor/bin" }),
    diagnostics.zsh,
  },
})

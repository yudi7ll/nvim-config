local utils = require('common.utils')
local nmap = utils.nmap
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

nmap('<leader>ni', '<CMD>NullLsInfo<CR>')
nmap('<leader>nl', '<CMD>NullLsLog<CR>')

null_ls.setup({
  sources = {
    formatting.prettierd,
    formatting.eslint,
    formatting.blade_formatter,
    diagnostics.zsh,
    diagnostics.editorconfig_checker.with({ command = "editorconfig-checker" }),
  },
})

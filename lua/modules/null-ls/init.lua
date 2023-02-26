local utils = require("common.utils")
local nmap = utils.nmap
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

nmap("<leader>ni", "<CMD>NullLsInfo<CR>")
nmap("<leader>nl", "<CMD>NullLsLog<CR>")

null_ls.setup({
  sources = {
    formatting.blade_formatter,
    formatting.stylua,
    diagnostics.zsh,
    formatting.dart_format,
    code_actions.eslint,
  },
})

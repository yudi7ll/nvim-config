local utils = require("common.utils")
local nmap = utils.nmap
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

nmap("<leader>ni", "<CMD>NullLsInfo<CR>")
nmap("<leader>nl", "<CMD>NullLsLog<CR>")

local group = vim.api.nvim_create_augroup("eslint_d_restart", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = group,
  pattern = {
    "package.json",
    "package-lock.json",
    "*eslint*",
  },
  callback = function()
    vim.cmd("silent exec '!eslint_d restart'")
  end,
})

null_ls.setup({
  sources = {
    formatting.eslint_d,
    formatting.blade_formatter,
    formatting.stylua,
    diagnostics.phpstan.with({ prefer_local = "./vendor/bin" }),
    diagnostics.zsh,
  },
})

vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.loader.enable()

vim.cmd("syntax enable")
vim.cmd("filetype plugin on")
vim.cmd("colorscheme saria-one")

local jsonToJsoncGroup = vim.api.nvim_create_augroup("JsonToJsonc", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json" },
  command = "set filetype=jsonc",
  group = jsonToJsoncGroup,
})

local envToSh = vim.api.nvim_create_augroup("EnvToSh", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = ".env.*",
  command = "set filetype=sh",
  group = envToSh,
})

local logToConfig = vim.api.nvim_create_augroup("LogToConfig", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = "*.log",
  command = "set filetype=config",
  group = logToConfig,
})

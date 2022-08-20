vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.cursorhold_updatetime = 200
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.cmd("syntax enable")
vim.cmd("filetype plugin on")
vim.cmd("colorscheme onearc")
vim.cmd("set completeopt=menu,menuone,noselect")

local group = vim.api.nvim_create_augroup("JsonToJsonc", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "json" },
	command = "set filetype=jsonc",
	group = group,
})

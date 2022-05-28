local utils = require("common.utils")
local nmap = utils.nmap

require("bufferline").setup({
	options = {
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		offsets = { {
			filetype = "NvimTree",
			text = "File Explorer",
			text_align = "center",
		} },
	},
})

nmap("<C-t>", ":enew<CR>", { noremap = true, silent = true })
nmap("<C-W>q", ":bp <BAR> bd #<CR>", { noremap = true, silent = true })
nmap("<C-W><C-q>", ":bp <BAR> bd #<CR>", { noremap = true, silent = true })
nmap("<C-q>", ":bp <BAR> bd #<CR>", { noremap = true, silent = true })
nmap("<A-q>", ":bp <BAR> bd #<CR>", { noremap = true, silent = true })
nmap("<A-,>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
nmap("<A-.>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
nmap("<C-<>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
nmap("<C->>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })

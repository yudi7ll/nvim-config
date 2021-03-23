require('bufferline').setup {
	options = {
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or ""
			return " " .. icon .. count
		end,
		enforce_regular_tabs = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
	}
}

vim.api.nvim_set_keymap('n', '<C-W>q', ':bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-W><C-q>', ':bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-,>', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-.>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })

require('bufferline').setup {
	options = {
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or ""
			return " " .. icon .. count
		end,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		sort_by = 'relative_directory',
		persist_buffer_sort = true,
		separator_style = 'thin',
	}
}

vim.api.nvim_set_keymap('n', '<C-W>q', ':Bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-W><C-q>', ':Bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })

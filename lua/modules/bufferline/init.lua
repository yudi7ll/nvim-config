require('bufferline').setup {
	options = {
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		-- separator_style = 'thin',
	}
}

vim.api.nvim_set_keymap('n', '<C-W>q', ':bp <BAR> bd #<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-W><C-q>', ':bp <BAR> bd #<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-q>', ':bp <BAR> bd #<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })

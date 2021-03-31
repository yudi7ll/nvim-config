local wk = require('whichkey_setup')

vim.api.nvim_set_keymap('n', '<leader>', ":WhichKey '<Space>'<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>', ":WhichKey ','<CR>", { noremap = true, silent = true })

local keymap = {
	a = {
		name = '+CocAction',
	}
}

wk.register_keymap('leader', keymap)

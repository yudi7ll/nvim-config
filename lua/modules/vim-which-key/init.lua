local wk = require('whichkey_setup')

vim.g.which_key_timeout = 100

vim.api.nvim_set_keymap('n', '<leader>', ":WhichKey '<Space>'<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>', ":WhichKey ','<CR>", { noremap = true, silent = true })

local keymap = {
	a = {
		name = '+CocAction',
	},
	h = {
		name = '+Git',
	},
	c = {
		name = '+COC'
	}
}

wk.register_keymap('leader', keymap)

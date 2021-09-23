local wk = require('whichkey_setup')

vim.api.nvim_set_keymap('n', '<leader>', ":WhichKey '<Space>'<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>', ":WhichKey ','<CR>", { noremap = true, silent = true })

local keymap = {
	a = {
		name = '+coc-action',
	},
	g = {
		name = '+git',
	},
	c = {
		name = '+coc'
	},
}

local local_keymap = {
  c = {
    name = '+pick-color'
  },
  T = {
    name = '+floaterm-toggle'
  },
  t = {
    name = '+floaterm'
  },
  h = {
    name = '+clear-highlight'
  }
}

wk.register_keymap('leader', keymap)
wk.register_keymap('localleader', local_keymap)

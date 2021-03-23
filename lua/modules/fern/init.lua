vim.api.nvim_set_keymap( 'n', '<C-n>', ':Fern . -drawer -reveal=% -width=38 -toggle<CR>',
	{ noremap = true, silent = true  })

vim.g['fern#renderer']                 = 'nerdfont'
vim.g['fern#disable_default_mappings'] = 1

-- function InitFern()
	vim.api.nvim_set_keymap('n', '<buffer>', '<Plug>(fern-custom-open-expand) \
		fern#smart#leaf("<Plug>(fern-action-open-or-enter)", "<Plug>(fern-action-expand:stay)")', { expr = true })
	vim.api.nvim_set_keymap('n', '<buffer> A', '<Plug>(fern-action-new-dir)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> a', '<Plug>(fern-action-new-file)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> c', '<Plug>(fern-action-clipboard-copy)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> D', '<Plug>(fern-action-trash)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> d', '<Plug>(fern-action-remove)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> h', '<Plug>(fern-action-collapse)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> l', '<Plug>(fern-custom-open-expand)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> m', '<Plug>(fern-action-choice)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> o', '<Plug>(fern-custom-open-expand)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> p', '<Plug>(fern-action-clipboard-paste)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> r', '<Plug>(fern-action-move)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> R', '<Plug>(fern-action-reload)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> s', '<Plug>(fern-action-open:split)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> H', '<Plug>(fern-action-hidden:toggle)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> t', '<Plug>(fern-action-open:tabedit)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> v', '<Plug>(fern-action-open:vsplit)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> x', '<Plug>(fern-action-clipboard-move)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> X', '<Plug>(fern-action-open:system)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> <BS>', '<Plug>(fern-action-leave)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> <CR>', '<Plug>(fern-action-open-or-enter)', { noremap = true  })
	vim.api.nvim_set_keymap('n', '<buffer> <TAB>', '<Plug>(fern-action-mark:toggle)', { noremap = true  })
-- end

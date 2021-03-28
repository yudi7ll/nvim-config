-- Terminal
vim.g.floaterm_keymap_new    = '<leader>tn'
vim.g.floaterm_keymap_prev   = '<leader>tk'
vim.g.floaterm_keymap_next   = '<leader>tj'
vim.g.floaterm_keymap_toggle = '<leader>T'

-- _G.toggle_terminal = function ()
-- 	if vim.api.nvim_buf_get_option('filetype') == 'floaterm' then
-- 		return ':FloattermHide'
-- 	end
-- 	return ':FloatermNew --width=0.9 --height=0.9 --name=terminal<CR>'
-- end

-- Lazygit
vim.api.nvim_set_keymap('n', '<leader>tg', ':FloatermNew --width=0.9 --height=0.9 --name=lazygit --autoclose=2 lazygit<CR>', { noremap = true, silent = true })
-- lazydocker
vim.api.nvim_set_keymap('n', '<leader>td', ':FloatermNew --width=0.9 --height=0.9 --name=lazydocker --autoclose=2 lazydocker<CR>', { noremap = true, silent = true })
-- Terminal
-- vim.api.nvim_set_keymap('n', '<leader>T', 'v:lua.toggle_terminal()', { noremap = true, silent = true })


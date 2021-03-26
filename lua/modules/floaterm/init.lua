-- Terminal
vim.g.floaterm_keymap_new    = '<leader>tn'
vim.g.floaterm_keymap_prev   = '<leader>tk'
vim.g.floaterm_keymap_next   = '<leader>tj'
vim.g.floaterm_keymap_toggle = '<leader>T'

-- Lazygit
vim.api.nvim_set_keymap('n', '<leader>tg', ':FloatermNew --width=0.9 --height=0.9 --name=lazygit --autoclose=2 lazygit<CR>', { noremap = true, silent = true })
-- lazydocker
vim.api.nvim_set_keymap('n', '<leader>td', ':FloatermNew --width=0.9 --height=0.9 --name=lazydocker --autoclose=2 lazydocker<CR>', { noremap = true, silent = true })

vim.g.floaterm_keymap_toggle = '<silent><localleader>T'
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

vim.api.nvim_command('hi FloatermBorder guibg=nil')

-- Lazygit
vim.api.nvim_set_keymap('n', '<localleader>tg', ':FloatermNew --name=lazygit --autoclose=2 lazygit<CR>', { noremap = true, silent = true })
-- lazydocker
vim.api.nvim_set_keymap('n', '<localleader>td', ':FloatermNew --name=lazydocker --autoclose=2 lazydocker<CR>', { noremap = true, silent = true })

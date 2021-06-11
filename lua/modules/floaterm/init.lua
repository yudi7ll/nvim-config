local nmap = require('common.utils').nmap

vim.g.floaterm_keymap_toggle = '<silent><localleader>T'
vim.g.floaterm_keymap_new    = '<F7>'
vim.g.floaterm_keymap_prev   = '<F8>'
vim.g.floaterm_keymap_next   = '<F9>'
vim.g.floaterm_width         = 0.9
vim.g.floaterm_height        = 0.9

vim.api.nvim_command('hi FloatermBorder guibg=nil')

-- Lazygit
nmap('<localleader>tg', ':FloatermNew --name=lazygit --autoclose=2 lazygit<CR>', { noremap = true, silent = true })
-- lazydocker
nmap('<localleader>td', ':FloatermNew --name=lazydocker --autoclose=2 lazydocker<CR>', { noremap = true, silent = true })
-- ncdu
nmap('<localleader>tu', ':FloatermNew --name=lazydocker --autoclose=2 ncdu<CR>', { noremap = true, silent = true })

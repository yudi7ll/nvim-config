local utils = require('common.utils')
local nmap = utils.nmap
local tmap = utils.tmap

vim.g.floaterm_keymap_toggle = '<silent><localleader>T'
vim.g.floaterm_keymap_new    = '<localleader>tn'
vim.g.floaterm_keymap_prev   = '<F8>'
vim.g.floaterm_keymap_next   = '<F9>'
vim.g.floaterm_keymap_kill   = '<localleader>tq'
vim.g.floaterm_width         = 0.9
vim.g.floaterm_height        = 0.9

vim.api.nvim_command('hi FloatermBorder guibg=none')

-- Lazygit
nmap('<localleader>tg', ':FloatermNew --name=lazygit --autoclose=2 lazygit<CR>', { noremap = true, silent = true })
-- lazydocker
nmap('<localleader>td', ':FloatermNew --name=lazydocker --autoclose=2 lazydocker<CR>', { noremap = true, silent = true })
-- ncdu
nmap('<localleader>tu', ':FloatermNew --name=lazydocker --autoclose=2 ncdu<CR>', { noremap = true, silent = true })

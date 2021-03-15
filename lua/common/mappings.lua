-- edit files on the same dir
vim.api.nvim_set_keymap('n', '<Leader>e', ':e <C-R>=expand("%:p:h") . "/"<CR>', { noremap = true })

-- Tab
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true })

-- FZF
vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>', { noremap = true })

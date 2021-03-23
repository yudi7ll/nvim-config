-- edit files on the same dir
vim.api.nvim_set_keymap('n', '<Leader>e', ':e <C-R>=expand("%:p:h") . "/"<CR>', { noremap = true })

-- Buffer
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })

-- FZF
vim.api.nvim_set_keymap('n', '<C-p>', ':<C-u>FZF<CR>', { noremap = true, silent = true })

-- Stop the highlighting for `hlsearch`
vim.api.nvim_set_keymap('n', '<space>h', ':noh<CR>', { noremap = true, silent = true })

-- Packer
vim.api.nvim_set_keymap('n', '<F5>', ':PackerSync<CR>', { noremap = true })

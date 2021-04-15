-- FZF
vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>', { noremap = true, silent = true })

-- Stop the highlighting for `hlsearch`
vim.api.nvim_set_keymap('n', '<space>h', ':noh<CR>', { noremap = true, silent = true })

-- Packer
vim.api.nvim_set_keymap('n', '<F5>', ':PackerSync<CR>', { noremap = true })

-- prevent common mistake of pressing q: instead :q
vim.api.nvim_set_keymap('n', 'q:', ':q', { noremap = true })

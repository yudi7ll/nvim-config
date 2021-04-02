-- edit files on the same dir
vim.api.nvim_set_keymap('n', '<Leader>e', ':e <C-R>=expand("%:p:h") . "/"<CR>', { noremap = true })

-- Buffer
vim.api.nvim_set_keymap('n', '<C-t>', ':enew<CR>', { noremap = true, silent = true })

-- FZF
vim.api.nvim_set_keymap('n', '<C-p>', ':FZF<CR>', { noremap = true, silent = true })

-- Stop the highlighting for `hlsearch`
vim.api.nvim_set_keymap('n', '<space>h', ':noh<CR>', { noremap = true, silent = true })

-- Packer
vim.api.nvim_set_keymap('n', '<F5>', ':PackerSync<CR>', { noremap = true })

-- Vim which key
vim.api.nvim_set_keymap('n', '<leader>', ":WhichKey '<Space>'<CR>", { noremap = true, silent = true })

-- prevent common mistake of pressing q: instead :q
vim.api.nvim_set_keymap('n', 'q:', ':q', { noremap = true })

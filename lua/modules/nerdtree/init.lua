local utils = require('common.utils')

-- Open the existing NERDTree on each new tab
vim.cmd('autocmd BufWinEnter * silent NERDTreeMirror')

-- Exit Vim if NERDTree is the only window left.
-- vim.cmd("autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")


vim.api.nvim_set_keymap('n', '<C-n>' , ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>' , ':NERDTreeFind<CR>', { noremap = true, silent = true })

vim.g.NERDTreeMapCloseDir = 'h'
vim.g.NERDTreeMapRefresh = 'R'
vim.g.NERDTreeMapCWD = '<CR>'
vim.g.NERDTreeMapToggleHidden = 'H'

vim.g.NERDTreeHighlightCursorline = true
vim.g.NERDTreeHijackNetrw = true
vim.g.NERDTreeMinimalUI = true
vim.g.NERDTreeWinSize = 38
vim.g.NERDTreeAutoDeleteBuffer = true
-- vim.g.NERDTreeRemoveFileCmd = '/usr/bin/trash'
-- vim.g.NERDTreeRemoveDirCmd = '/usr/bin/trash'

vim.g.python_host_prog       = '/usr/bin/python2'
vim.g.python3_host_prog      = '/usr/bin/python3'
vim.g.cursorhold_updatetime  = 100
vim.g.mapleader              = ' '
vim.g.maplocalleader         = ','

vim.cmd('au CursorHold * checktime')
vim.cmd('set shortmess+=c')
vim.cmd('syntax enable')
vim.cmd('filetype plugin on')

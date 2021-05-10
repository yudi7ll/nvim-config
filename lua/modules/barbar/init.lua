local utils = require('common.utils')
local nmap = utils.nmap

nmap('<C-t>', ':enew<CR>', { noremap = true, silent = true })
nmap('<C-W>q', ':bp <BAR> BufferClose #<CR>', { noremap = true, silent = true })
nmap('<C-W><C-q>', ':bp <BAR> BufferClose #<CR>', { noremap = true, silent = true })
nmap('<C-q>', ':bp <BAR> BufferClose #<CR>', { noremap = true, silent = true })
nmap('<A-q>', ':bp <BAR> BufferClose #<CR>', { noremap = true, silent = true })
nmap('<A-.>', ':BufferNext<CR>', { noremap = true, silent = true })
nmap('<A-,>', ':BufferPrevious<CR>', { noremap = true, silent = true })
nmap('<A->>', ':BufferMoveNext<CR>', { noremap = true, silent = true })
nmap('<A-<>', ':BufferMovePrevious<CR>', { noremap = true, silent = true })

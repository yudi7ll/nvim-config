local utils = require('common.utils')
local nmap = utils.nmap

-- FZF
nmap('<C-p>', ':FZF<CR>', { noremap = true, silent = true })

-- Stop the highlighting for `hlsearch`
nmap('<localleader>h', ':noh<CR>', { noremap = true, silent = true })

-- Packer
nmap('<F5>', ':PackerSync<CR>', { noremap = true })

-- prevent common mistake of pressing q: instead :q
nmap('q:', ':q', { noremap = true })

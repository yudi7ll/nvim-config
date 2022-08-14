local utils = require("common.utils")
local nmap = utils.nmap
local imap = utils.imap

nmap("<localleader>h", ":noh<CR>", { noremap = true, silent = true })
nmap("<F5>", ":PackerSync<CR>", { noremap = true })
nmap("q:", ":q", { noremap = true, silent = true })
imap('<CR>', '\n', {noremap = true, silent = true})


local utils = require("common.utils")
local nmap = utils.nmap

nmap("<localleader>h", "<CMD>noh<CR>", { noremap = true, silent = true })
nmap("<F5>", "<CMD>PackerSync<CR>", { noremap = true })
nmap("q:", "<CMD>q", { noremap = true, silent = true })

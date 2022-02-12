local utils = require("common.utils")
local nmap = utils.nmap

nmap("<C-p>", ":Files<CR>", { noremap = true, silent = true })
nmap("<localleader>h", ":noh<CR>", { noremap = true, silent = true })
nmap("<F5>", ":PackerSync<CR>", { noremap = true })
nmap("q:", ":q", { noremap = true, silent = true })

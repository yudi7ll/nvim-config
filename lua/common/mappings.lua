local utils = require("common.utils")
local nmap = utils.nmap

nmap("<C-p>", "<CMD>Files<CR>")
nmap("<localleader>h", "<CMD>noh<CR>")
nmap("<F5>", "<CMD>PackerSync<CR>")
nmap("q:", ":q", { silent = false })

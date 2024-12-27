local utils = require("common.utils")
local nmap, tmap = utils.nmap, utils.tmap

vim.g.floaterm_title = "Terminal [$1/$2]"
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

local floatermResized = vim.api.nvim_create_augroup("FloatermResized", { clear = true })
vim.api.nvim_create_autocmd({ "VimResized" }, {
  command = ":FloatermUpdate<CR>",
  group = floatermResized,
})

nmap("<localleader>T", "<CMD>FloatermToggle<CR>")
tmap("<localleader>T", "<CMD>FloatermToggle<CR>")

nmap("<localleader>tn", "<CMD>FloatermNew<CR>")

nmap("<C-,>", "<CMD>FloatermPrev<CR>")
tmap("<C-,>", "<CMD>FloatermPrev<CR>")

nmap("<C-.>", "<CMD>FloatermNext<CR>")
tmap("<C-.>", "<CMD>FloatermNext<CR>")

tmap("<localleader>tn", "<CMD>FloatermNew --name=floaterm --autoclose=2<CR>")
tmap("<localleader>tq", "<CMD>FloatermKill --name=floaterm --autoclose=2<CR>")

-- Lazygit
nmap("<localleader>tg", "<CMD>FloatermNew --name=lazygit --autoclose=2 lazygit<CR>")
-- lazydocker
nmap("<localleader>td", "<CMD>FloatermNew --name=lazydocker --autoclose=2 lazydocker<CR>")
-- ncdu
nmap("<localleader>tu", "<CMD>FloatermNew --name=lazydocker --autoclose=2 ncdu --color dark<CR>")

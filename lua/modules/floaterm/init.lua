local utils = require("common.utils")
local nmap = utils.nmap

vim.g.floaterm_title = "Terminal [$1/$2]"
vim.g.floaterm_keymap_toggle = "<silent><localleader>T"
vim.g.floaterm_keymap_new = "<localleader>tn"
vim.g.floaterm_keymap_prev = "<A-.>"
vim.g.floaterm_keymap_next = "<A-,>"
vim.g.floaterm_keymap_kill = "<localleader>tq"
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

local floatermResized = vim.api.nvim_create_augroup("FloatermResized", { clear = true })
vim.api.nvim_create_autocmd({ "VimResized" }, {
  command = ":FloatermUpdate<CR>",
  group = floatermResized,
})

-- Lazygit
nmap("<localleader>tg", "<CMD>FloatermNew --name=lazygit --autoclose=2 lazygit<CR>")
-- lazydocker
nmap("<localleader>td", "<CMD>FloatermNew --name=lazydocker --autoclose=2 lazydocker<CR>")
-- ncdu
nmap("<localleader>tu", "<CMD>FloatermNew --name=lazydocker --autoclose=2 ncdu --color dark<CR>")

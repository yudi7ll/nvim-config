local nmap = require('common.utils').nmap

require("colorizer").setup({
  html = { names = false },
  lua = { names = false },
})

nmap("<localleader>ct", "<CMD>ColorizerToggle<CR>")
nmap("<localleader>cc", "<CMD>PickColor<CR>")

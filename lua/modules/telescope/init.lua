require('telescope').setup({
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
})

local utils = require('common.utils')
local nmap = utils.nmap

nmap('<C-p>', ':lua require("telescope.builtin").find_files()<CR>')

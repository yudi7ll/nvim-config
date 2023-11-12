local nmap = require('common.utils').nmap

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
nmap("<localleader>fR", require("ufo").openAllFolds)
nmap("<localleader>fM", require("ufo").closeAllFolds)
nmap("<localleader>fo", "zo")
nmap("<localleader>fO", "zO")

require("ufo").setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})

local utils = require('common.utils')
local create_augroup = utils.create_augroup

require('nvim-treesitter.configs').setup ({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

create_augroup({
  {'FileType blade TSBufDisable highlight'},
}, 'disable_treesitter_on_ft_blade')

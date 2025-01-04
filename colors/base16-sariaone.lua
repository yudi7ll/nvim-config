local colors = require "colors.sariaone"
local base16_colorscheme = require "base16-colorscheme"

vim.env.BASE16_THEME = "onedark"
vim.g.colors_name = "base16-sariaone"

base16_colorscheme.setup(vim.tbl_deep_extend("force", base16_colorscheme.colors, colors), {
  telescope = true,
  telescope_borders = true,
  indentblankline = false,
  notify = true,
  ts_rainbow = true,
  cmp = false,
  illuminate = false,
  dapui = false,
  mini_completion = false,
})

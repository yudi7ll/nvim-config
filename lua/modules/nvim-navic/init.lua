local navic = require("nvim-navic")
local icons = require("lib.lsp-icons")

navic.setup({
  icons = icons,
  lsp = {
    auto_attach = false,
    preference = nil,
  },
  highlight = false,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true,
  click = false,
})

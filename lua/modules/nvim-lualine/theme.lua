local theme = require("lualine.themes.auto")

-- TODO: update theme
return vim.tbl_extend("keep", theme, {
  visual = theme.visual,
})

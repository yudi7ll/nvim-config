local theme = require("lualine.themes.auto")

return vim.tbl_extend("keep", theme, {
	visual = theme.visual,
})

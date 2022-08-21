local gps = require("nvim-gps")
local theme = require("modules.nvim-lualine.theme")

require("lualine").setup({
	options = {
		theme = theme,
		component_separators = "|",
		section_separators = { left = "", right = "" },
		globalstatus = true,
		disabled_filetypes = {
			winbar = { "floaterm", "NvimTree", "packer" },
		},
		refresh = {
			statusline = 100,
		},
		ignore_focus = {
			"",
			"NvimTree",
			"packer",
			"LspsagaHover",
			"LspsagaRename",
			"LspsagaFinder",
			"LspsagaCodeAction",
			"sagahover",
			"sagafinder",
			"sagarename",
			"sagacodeaction",
			"floaterm",
			"TelescopePrompt",
			"TelescopeResults",
		},
	},
	winbar = {
		lualine_b = { "filetype" },
		lualine_c = { "b:coc_current_function" },
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { "fileformat", "filename", "branch", "b:gitsigns_status" },
		lualine_c = { "diagnostics" },
		lualine_x = { "g:coc_status" },
		lualine_y = { "encoding", "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_winbar = {
		lualine_b = { "filetype" },
		lualine_c = {
			{ gps.get_location, cond = gps.is_available },
		},
	},
	inactive_sections = {
		lualine_a = { "filetype" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
})

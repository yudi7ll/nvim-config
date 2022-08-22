local navic = require("nvim-navic")
local theme = require("modules.nvim-lualine.theme")
local lsp_status = require("lsp-status.statusline").status

require("lualine").setup({
	options = {
		theme = theme,
		component_separators = "|",
		section_separators = { left = "", right = "" },
		globalstatus = true,
		disabled_filetypes = {
			winbar = { "floaterm", "NvimTree", "packer" },
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
		lualine_c = {
			{ navic.get_location, cond = navic.is_available },
		},
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
		lualine_c = { "fileformat" },
		lualine_x = { "diagnostics", lsp_status },
		lualine_y = { "progress" },
		lualine_z = {
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
	inactive_winbar = {
		lualine_b = { "filetype" },
		lualine_c = {
			{ navic.get_location, cond = navic.is_available },
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

local utils = require("modules.nvim-lualine.utils")
-- local navic = require("nvim-navic")
local theme = require("modules.nvim-lualine.theme")

vim.g.navic_silence = true

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = "|",
    section_separators = { left = "", right = "" },
    globalstatus = true,
    disabled_filetypes = {
      winbar = { "floaterm", "NvimTree", "packer" },
    },
    refresh = {
      statusline = 100,
      winbar = 100,
    },
    ignore_focus = {
      "",
      "lazy",
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
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = { utils.filename_with_icon, "branch" },
    lualine_c = {},
    lualine_x = { "diagnostics" },
    lualine_y = {
      "fileformat",
      utils.show_tab_size,
      "encoding",
      "filetype",
    },
    lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
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

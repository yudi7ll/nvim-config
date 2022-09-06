local utils = require("modules.nvim-lualine.utils")
local navic = require("nvim-navic")
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
    lualine_b = {
      { utils.show_file_path, separator = ">" },
      { utils.filetype_with_icon, separator = ">" },
      { navic.get_location, cond = navic.is_available },
    },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = { "filename", "branch" },
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
  inactive_winbar = {
    lualine_b = {
      { utils.show_file_path, separator = ">" },
      { utils.filetype_with_icon, separator = ">" },
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

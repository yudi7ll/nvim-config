---@type LazySpec
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = function()
    local theme = require "lualine.themes.onedark"
    local component = require "lualine.component"
    local filetype = require "lualine.components.filetype"

    local utils = {}

    utils.show_tab_size = function()
      return "spaces " .. vim.bo.shiftwidth
    end

    utils.filename_with_icon = component:extend()
    utils.filename_with_icon.update_status = function()
      return vim.fn.fnamemodify(vim.fn.expand "%", ":t")
    end
    utils.filename_with_icon.apply_icon = filetype.apply_icon
    utils.filepath = function()
      return string.gsub(vim.fn.fnamemodify(vim.fn.expand "%", ":p:~:.:h"), "/", " > ")
    end
    -- utils.filepath_available = function()
    --   return M.filepath() ~= "."
    -- end

    return {
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
    }
  end,
}

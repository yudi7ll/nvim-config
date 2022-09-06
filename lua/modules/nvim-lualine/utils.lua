local filename = require("lualine.components.filename")
local filetype = require("lualine.components.filetype")

local M = {}

M.show_tab_size = function()
  return "spaces " .. vim.bo.shiftwidth
end

M.filetype_with_icon = filename:extend()
M.filetype_with_icon.apply_icon = filetype.apply_icon

M.show_file_path = function()
  local fn = string.gsub(
    ---@diagnostic disable-next-line: missing-parameter
    vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:.:h"),
    "/",
    " > "
  )

  return fn == "." and "" or fn
end

return M

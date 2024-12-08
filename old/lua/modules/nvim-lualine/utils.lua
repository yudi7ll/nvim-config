local component = require("lualine.component")
local filetype = require("lualine.components.filetype")

local M = {}

M.show_tab_size = function()
  return "spaces " .. vim.bo.shiftwidth
end

M.filename_with_icon = component:extend()
M.filename_with_icon.update_status = function()
  return vim.fn.fnamemodify(vim.fn.expand("%"), ":t")
end
M.filename_with_icon.apply_icon = filetype.apply_icon

M.filepath = function()
  return string.gsub(
    vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:.:h"),
    "/",
    " > "
  )
end

M.filepath_available = function()
  return M.filepath() ~= "."
end

return M

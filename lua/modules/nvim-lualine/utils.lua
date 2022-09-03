local M = {}

M.show_tab_size = function()
  return "spaces " .. vim.bo.shiftwidth
end

M.show_file_path = function()
  return string.gsub(
    ---@diagnostic disable-next-line: missing-parameter
    vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:."),
    "/",
    " > "
  )
end

return M

local M = {}

M.diagnostic_active = true

M.toggle = function()
  if M.diagnostic_active then
    M.diagnostic_active = false
    vim.diagnostic.hide()
    vim.notify("Diagnostics: off")
  else
    M.diagnostic_active = true
    vim.diagnostic.show()
    vim.notify("Diagnostics: on")
  end
end

return M

return function()
  local msg = ""
  local clients = vim.lsp.get_active_clients()

  if next(clients) == nil then
    return msg
  end

  msg = clients[#clients].name

  return "  " .. msg
end

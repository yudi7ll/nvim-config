return function()
	local msg = ""
	local clients = vim.lsp.get_active_clients()

	if next(clients) == nil then
		return msg
	end

	msg = clients[#clients].name

	if msg == "null-ls" then
		msg = clients[1].name
	end

	return "  " .. msg
end

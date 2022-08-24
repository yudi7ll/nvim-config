local M = {}

local map = function(mode, key, cmd, config)
	vim.keymap.set(
		mode,
		key,
		cmd,
		vim.tbl_extend("force", {
			noremap = true,
			silent = true,
		}, config or {})
	)
end

M.nmap = function(key, cmd, config)
	map("n", key, cmd, config)
end

M.xmap = function(key, cmd, config)
	map("x", key, cmd, config)
end

M.imap = function(key, cmd, config)
	map("i", key, cmd, config)
end

M.smap = function(key, cmd, config)
	map("s", key, cmd, config)
end

M.tmap = function(key, cmd, config)
	map("t", key, cmd, config)
end

M.vmap = function(key, cmd, config)
	map("v", key, cmd, config)
end

M.show_diagnostic_under_cursor = function(bufnr)
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost", "DiffUpdated" },
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
end

M.format_on_save = function(client, bufnr)
	local au_lsp_formatting = vim.api.nvim_create_augroup("LspFormatting", {})
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = au_lsp_formatting, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = au_lsp_formatting,
			buffer = bufnr,
			callback = function()
				if client.name == "sumneko_lua" or client.name == "tsserver" then
					vim.lsp.buf.format({ bufnr = bufnr })
				end
			end,
		})
	end
end

M.highlight_symbol_under_cursor = function(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_augroup("lsp_document_highlight", {
			clear = false,
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = "lsp_document_highlight",
		})
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

M.show_tab_size = function()
	return "spaces " .. vim.bo.shiftwidth
end

return M

local M = {}
local lsp_status = require("lsp-status")
local navic = require("nvim-navic")
local colorizer = require("colorizer")
local keymaps = require("modules.nvim-lspconfig.keymaps")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
local au_lsp_formatting = vim.api.nvim_create_augroup("LspFormatting", {})
local format_on_save = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = au_lsp_formatting, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = au_lsp_formatting,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end
local show_diagnostic_under_cursor = function(bufnr)
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
local highlight_symbol_under_cursor = function(client, bufnr)
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

vim.g.navic_silence = true
lsp_status.register_progress()

M.capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
M.on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	lsp_status.register_client(client)
	lsp_status.on_attach(client)
	navic.attach(client, bufnr)
	colorizer.attach_to_buffer(bufnr)
	format_on_save(client, bufnr)
	keymaps.setup_keymaps(bufnr)
	show_diagnostic_under_cursor(bufnr)
	highlight_symbol_under_cursor(client, bufnr)
end

return M

local M = {}

M.on_attach = function(_, bufnr)
  local map = function(keys, func, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
  end

  map("<leader>ac", "<cmd>Lspsaga code_action<cr>", "Lspsaga | Code Action", { "n", "x" })
  map("<leader>ao", "<cmd>Lspsaga outline<cr>", "Lspsaga | Code Outline")
  map("<leader>aO", "<cmd>Lspsaga outgoing_calls<cr>", "Lspsaga | Outgoing Calls")
  map("<leader>aI", "<cmd>Lspsaga incoming_calls<cr>", "Lspsaga | Incoming Calls")
  map("<leader>ar", "<cmd>Lspsaga rename <cr>", "Lspsaga | Rename")
  map("K", "<cmd>Lspsaga hover_doc<cr>", "Lspsaga | Hover")
  map("gn", "<cmd>Lspsaga diagnostic_jump_next<cr>", "Lspsaga | Next Diagnostic")
  map("gN", "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Lspsaga | Prev Diagnostic")
  map("gd", require("telescope.builtin").lsp_definitions, "LSP | Goto Definition")
  map("gr", require("telescope.builtin").lsp_references, "LSP | Goto References")
  map("gI", require("telescope.builtin").lsp_implementations, "LSP | Goto Implementation")
  map("<leader>aD", require("telescope.builtin").lsp_type_definitions, "LSP | Type Definition")
  map("<leader>as", require("telescope.builtin").lsp_document_symbols, "LSP | Document Symbols")
  map("<leader>aw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "LSP | Workspace Symbols")
  -- map('<leader>ar', vim.lsp.buf.rename, '[R]e[n]ame')
  -- map('<leader>ac', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
  map("gD", vim.lsp.buf.declaration, "LSP | Goto Declaration")
end

M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = function()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.foldingRange = { -- ufo
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
end

return M

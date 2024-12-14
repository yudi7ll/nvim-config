local M = {}

M.on_attach = function(_, bufnr)
  local map = require "custom.map"
  local ufo_peek = function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
      vim.cmd "Lspsaga hover_doc"
    end
  end

  map {
    { "<leader>ac", "<cmd>Lspsaga code_action<cr>", desc = "Lspsaga | Code Action" },
    { "<leader>ao", "<cmd>Lspsaga outline<cr>", desc = "Lspsaga | Code Outline" },
    { "<leader>aO", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Lspsaga | Outgoing Calls" },
    { "<leader>aI", "<cmd>Lspsaga incoming_calls<cr>", desc = "Lspsaga | Incoming Calls" },
    { "<leader>ar", "<cmd>Lspsaga rename <cr>", desc = "Lspsaga | Rename" },
    { "gn", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Lspsaga | Next Diagnostic" },
    { "gN", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Lspsaga | Prev Diagnostic" },
    { "gd", require("telescope.builtin").lsp_definitions, desc = "LSP | Goto Definition" },
    { "gr", require("telescope.builtin").lsp_references, desc = "LSP | Goto References" },
    { "gI", require("telescope.builtin").lsp_implementations, desc = "LSP | Goto Implementation" },
    { "<leader>aD", require("telescope.builtin").lsp_type_definitions, desc = "LSP | Type Definition" },
    { "<leader>as", require("telescope.builtin").lsp_document_symbols, desc = "LSP | Document Symbols" },
    { "<leader>aw", require("telescope.builtin").lsp_dynamic_workspace_symbols, desc = "LSP | Workspace Symbols" },
    { "gD", vim.lsp.buf.declaration, desc = "LSP | Goto Declaration" },
    { "K", ufo_peek, desc = "UFO or Lspsaga | Hover" },
  }
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

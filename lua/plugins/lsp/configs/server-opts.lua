local M = {}

M.on_attach = function(_, bufnr)
  local map = require "utils.map"

  map({
    {
      "gn",
      function()
        vim.diagnostic.goto_next { float = false }
      end,
      desc = "Next Diagnostic",
    },
    {
      "gN",
      function()
        vim.diagnostic.goto_prev { float = false }
      end,
      desc = "Prev Diagnostic",
    },
    { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
    { "gr", vim.lsp.buf.references, desc = "References" },
    -- { "gr", "<cmd>Telescope lsp_references<cr>", desc = "LSP | References", nowait = true },
    { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
    { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
    { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
    {
      "gK",
      function()
        return vim.lsp.buf.signature_help()
      end,
      desc = "Signature Help",
    },
    {
      "<c-k>",
      function()
        return vim.lsp.buf.signature_help()
      end,
      mode = "i",
      desc = "Signature Help",
    },
    { "<leader>ac", vim.lsp.buf.code_action, desc = "LSP | Code Action", mode = { "n", "v" } },
    { "<leader>al", vim.lsp.codelens.run, desc = "LSP | Run Codelens", mode = { "n", "v" } },
    { "<leader>cL", vim.lsp.codelens.refresh, desc = "LSP | Refresh & Display Codelens", mode = { "n" } },
    { "<leader>ar", vim.lsp.buf.rename, desc = "LSP | Rename", expr = true },
    {
      "<leader>ao",
      function()
        vim.lsp.buf.outgoing_calls()
      end,
      desc = "LSP | Outgoing Calls",
    },
    {
      "K",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      desc = "UFO or Hover | Hover",
    },
  }, { buffer = bufnr })

  -- map {
  --   { "<leader>ac", "<cmd>Lspsaga code_action<cr>", desc = "Lspsaga | Code Action" },
  --   { "<leader>ao", "<cmd>Lspsaga outline<cr>", desc = "Lspsaga | Code Outline" },
  --   { "<leader>aO", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Lspsaga | Outgoing Calls" },
  --   { "<leader>aI", "<cmd>Lspsaga incoming_calls<cr>", desc = "Lspsaga | Incoming Calls" },
  --   { "<leader>ar", "<cmd>Lspsaga rename <cr>", desc = "Lspsaga | Rename" },
  --   { "gn", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Lspsaga | Next Diagnostic" },
  --   { "gN", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Lspsaga | Prev Diagnostic" },
  --   { "gd", require("telescope.builtin").lsp_definitions, desc = "LSP | Goto Definition" },
  --   { "gr", require("telescope.builtin").lsp_references, desc = "LSP | Goto References" },
  --   { "gI", require("telescope.builtin").lsp_implementations, desc = "LSP | Goto Implementation" },
  --   { "<leader>aD", require("telescope.builtin").lsp_type_definitions, desc = "LSP | Type Definition" },
  --   { "<leader>as", require("telescope.builtin").lsp_document_symbols, desc = "LSP | Document Symbols" },
  --   { "<leader>aw", require("telescope.builtin").lsp_dynamic_workspace_symbols, desc = "LSP | Workspace Symbols" },
  --   { "gD", vim.lsp.buf.declaration, desc = "LSP | Goto Declaration" },
  --   { "K", ufo_peek, desc = "UFO or Lspsaga | Hover" },
  -- }
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

require("cosmic-ui").setup({
  border_style = "single",
  rename = {
    border = {
      highlight = "NormalFloat",
      style = nil,
      title = " Rename ",
      title_align = "center",
      title_hl = "NormalFloat",
    },
    prompt = "> ",
    prompt_hl = "Comment",
  },
  code_actions = {
    min_width = nil,
    border = {
      bottom_hl = "NormalFloat",
      highlight = "NormalFloat",
      style = nil,
      title = "Code Actions",
      title_align = "center",
      title_hl = "NormalFloat",
    },
  },
})

local au_cursor_diagnostic = vim.api.nvim_create_augroup("CursorDiagnostic", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = vim.diagnostic.open_float,
  group = au_cursor_diagnostic,
})

vim.diagnostic.config({
  virtual_text = false,
  float = {
    scope = "cursor"
  }
})

-- vim.lsp.handlers['textDocument/codeAction'] = require('lsputil.locations').code_action_handler
vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { focusable = false })

---@type LazySpec
return {
  "neovim/nvim-lspconfig",
  cmd = "LspInfo",
  keys = {
    { "<leader>li", '<cmd>LspInfo<cr>', desc = "LSP | Info" },
    { "<leader>lR", '<cmd>LspRestart<cr>', desc = "LSP | Restart" },
  },
  init = function()
    -- vim.keymap.set("n", "<leader>lf", "<cmd>Format<cr>", { desc = "lsp | format", silent = true })
    -- vim.keymap.set("n", "<leader>lF", "<cmd>FormatToggle<cr>", { desc = "lsp | toggle autoformat", silent = true })
    vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "lsp | info", silent = true })
    vim.keymap.set("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "lsp | restart", silent = true })

    vim.keymap.set("n", "<leader>lh", function()
      if vim.version().minor >= 10 then
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end
    end, { desc = "lsp | toggle inlay hints", silent = true })
  end,
}

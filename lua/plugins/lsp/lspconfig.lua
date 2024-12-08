---@diagnostic disable: missing-fields
---@type LazySpec
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP | Info" },
    { "<leader>lR", "<cmd>LspRestart<cr>", desc = "LSP | Restart" },
    {
      "<leader>lh",
      function()
        if vim.version().minor >= 10 then
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end
      end,
      desc = "LSP | Toggle Inlay Hints",
      silent = true,
    },
  },
  config = function()
    vim.diagnostic.config {
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    }
  end,
}

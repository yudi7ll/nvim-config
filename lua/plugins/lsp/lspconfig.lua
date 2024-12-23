---@type LazySpec
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP | Info" },
    { "<leader>lr", "<cmd>LspRestart<cr>", desc = "LSP | Restart" },
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
  -- init = function()
  --   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  --     border = "rounded", -- Customize the border
  --     -- Customize the handler to process the hover text
  --     callback = function(_, result, ctx, config)
  --       if not (result and result.contents) then
  --         return
  --       end
  --
  --       local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  --       markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
  --
  --       -- Remove backticks from fenced code blocks
  --       for i, line in ipairs(markdown_lines) do
  --         markdown_lines[i] = line:gsub("^```.*", "") -- Remove opening fences
  --         markdown_lines[i] = markdown_lines[i]:gsub("^```", "") -- Remove closing fences
  --       end
  --
  --       if vim.tbl_isempty(markdown_lines) then
  --         return
  --       end
  --
  --       vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
  --     end,
  --   })
  -- end,
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

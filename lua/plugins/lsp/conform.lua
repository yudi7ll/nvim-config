local formatters_by_ft = {
  lua = { "stylua" },
  python = { "autopep8" },
  cpp = { "clang_format" },
  c = { "clang_format" },
  go = { "gofumpt" },
  cs = { "csharpier" },
  yaml = { "yamlfmt" },
  css = { "prettier" },
  flow = { "prettier" },
  graphql = { "prettier" },
  html = { "prettier" },
  json = { "prettier" },
  javascriptreact = { "prettier" },
  javascript = { "prettier" },
  less = { "prettier" },
  markdown = { "prettier" },
  scss = { "prettier" },
  typescript = { "prettier" },
  typescriptreact = { "prettier" },
  vue = { "prettier" },
}

---@type LazySpec
return {
  -- NOTE: Formatting
  "stevearc/conform.nvim",
  event = "BufWritePre",
  keys = {
    {
      "<leader>af",
      "<cmd>Format<cr>",
      desc = "Format",
    },
  },
  config = function()
    require("conform").setup {
      format_after_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if not _G.format_on_save then
          return
        end
        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match "/node_modules/" then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      formatters_by_ft = formatters_by_ft,
    }

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format { async = true, lsp_format = "fallback", range = range }
    end, { range = true })
  end,
}

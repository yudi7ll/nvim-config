---@type LazySpec
return {
  enabled = false,
  "nvim-treesitter/nvim-treesitter-context",
  event = "LspAttach",
  keys = {
    {
      "<leader>co",
      function()
        require("treesitter-context").go_to_context(vim.v.count1)
      end,
      desc = "TS Context | Jump to Treesitter context",
    },
    {
      "<leader>cl",
      "<cmd>TSContextToggle<cr>",
      desc = "TS Context | Toggle Treesitter context",
    },
  },
  config = function()
    require("treesitter-context").setup {
      enable = true,           -- Enable this plugin (Can be enabled/disabled later via commands)
      multiwindow = false,     -- Enable multiwindow support.
      max_lines = 5,           -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0,   -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 1, -- Maximum number of lines to show for a single context
      trim_scope = "inner",    -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = "cursor",         -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = "",
      zindex = 20, -- The Z-index of the context window
      -- on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }

    vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Normal" })
  end,
}

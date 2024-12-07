---@type LazySpec
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<c-q>", "<cmd>bp <bar> bd #<cr>", desc = "Bufferline | Close Buffer" },
    { "<a-q>", "<cmd>bp <bar> bd #<cr>", desc = "Bufferline | Close Buffer" },
    { "<a-,>", "<cmd>BufferLineCyclePrev<cr>", desc = "Bufferline | Cycle Left" },
    { "<a-.>", "<cmd>BufferLineCycleNext<cr>", desc = "Bufferline | Cycle Right" },
    {
      "<a-a>",
      function()
        local curbufnr = vim.api.nvim_get_current_buf()
        local buflist = vim.api.nvim_list_bufs()
        for _, bufnr in ipairs(buflist) do
          if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, "bufpersist") ~= 1) then
            vim.cmd("bd " .. tostring(bufnr))
          end
        end
      end,
    },
  },
  cmd = {
    "BufferLineCyclePrev",
    "BufferLineCycleNext",
  },
  ---@type bufferline.UserConfig
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level)
        local icon = level:match "error" and " " or " "
        return " " .. icon .. count
      end,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = false,
      separator_style = "thin",
      sort_by = "insert_at_end",
      offsets = {
        {
          filetype = "NvimTree",
          text = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
          text_align = "center",
        },
        {
          filetype = "neo-tree",
          text = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
          text_align = "center",
        },
      },
    },
  },
}

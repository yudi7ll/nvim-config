---@type LazySpec
return {
  "akinsho/bufferline.nvim" ,
  event = "VeryLazy",
  keys = {
    {'<c-q>', '<cmd>bp <bar> bd #<cr>'},
    {'<a-q>', '<cmd>bp <bar> bd #<cr>'},
    {'<a-,>', '<cmd>BufferLineCyclePrev<cr>'},
    {'<a-.>', '<cmd>BufferLineCycleNext<cr>'}
  },
  cmd = {
    "BufferLineCyclePrev",
    "BufferLineCycleNext"
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
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
  }
}

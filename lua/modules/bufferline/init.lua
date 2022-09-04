local utils = require("common.utils")
local nmap = utils.nmap

require("bufferline").setup({
  options = {
    ---@diagnostic disable-next-line: assign-type-mismatch
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "slant",
    sort_by = "insert_at_end",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
      },
    },
  },
})

-- nmap("<C-t>", ":enew<CR>")
nmap("<C-W>q", "<CMD>bp <BAR> bd #<CR>")
nmap("<C-W><C-q>", "<CMD>bp <BAR> bd #<CR>")
nmap("<C-q>", "<CMD>bp <BAR> bd #<CR>")
nmap("<A-q>", "<CMD>bp <BAR> bd #<CR>")
nmap("<A-,>", "<CMD>BufferLineCyclePrev<CR>")
nmap("<A-.>", "<CMD>BufferLineCycleNext<CR>")
nmap("<A-a>", "<CMD>BufferLineCloseLeft<CR> <CMD>BufferLineCloseRight<CR>")
-- nmap("<A-<>", ":BufferLineMovePrev<CR>")
-- nmap("<A->>", ":BufferLineMoveNext<CR>")

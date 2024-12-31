local map = require "utils.map"

map {
  { "<localleader>w", "<CMD>w<CR>", desc = "Write buffer" },
  { "<leader>ll", "<CMD>Lazy<CR>", desc = "Lazy" },
  { "<esc>", "<CMD>noh<CR>", desc = "Clear Highlights" },
  { "<localleader>h", "<CMD>noh<CR>", desc = "Clear Highlights" },
  { "<localleader>xx", "<cmd>source %<cr>", desc = "Source current file", silent = false },
  { "<leader>qo", "<cmd>copen<cr>", desc = "Quickfix Open" },
  { "<localleader>qq", "<cmd>qa<cr>", desc = "Quit All Tabs" },
}

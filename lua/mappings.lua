local map = require "utils.map"

map {
  { "<leader>k", "<CMD>w<CR>", desc = "Write buffer" },
  { "<localleader>w", "<CMD>w<CR>", desc = "Write buffer" },
  { "<leader>ll", "<CMD>Lazy<CR>", desc = "Lazy" },
  { "<esc>", "<CMD>noh<CR>", desc = "Clear Highlights" },
  { "<localleader>h", "<CMD>noh<CR>", desc = "Clear Highlights" },
  { "<localleader>xx", "<cmd>source %<cr>", desc = "Source current file", silent = false },
  { "<leader>qo", "<cmd>copen<cr>", desc = "Quickfix Open" },
}

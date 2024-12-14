local map = require "custom.map"

map {
  { "<leader>k", "<CMD>w<CR>", desc = "Write buffer" },
  { "<localleader>w", "<CMD>w<CR>", desc = "Write buffer" },
  { "<leader>ll", "<CMD>Lazy<CR>", desc = "Lazy" },
  { "<esc>", "<CMD>noh<CR>", desc = "Clear Highlights" },
  { "<localleader>h", "<CMD>noh<CR>", desc = "Clear Highlights" },
  { "kj", "<esc>", desc = "Escape", mode = "i" },
  { "<Esc><Esc>", "<C-\\><C-n>", desc = "Exit terminal mode", mode = "t" },
  { "<leader>test", '<cmd>echo "test"<CR>', desc = "Test", mode = "n" },
}

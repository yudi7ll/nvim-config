require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>k", "<cmd> w <cr>")
map("n", "<leader>ar", require "nvchad.lsp.renamer")
map("n", "<c-p>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<C-n>", "<CMD>Neotree toggle<CR>", { desc = "toggle neotree", noremap = true })
map({ "n", "i", "v" }, "<F5>", "<cmd> Lazy sync <cr>", {silent = true})

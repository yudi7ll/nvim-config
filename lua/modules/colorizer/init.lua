require("colorizer").setup({
  html = { names = false },
  lua = { names = false },
})

vim.keymap.set("n", "<localleader>ct", "<CMD>ColorizerToggle<CR>")
vim.keymap.set("n", "<localleader>cc", "<CMD>PickColor<CR>")

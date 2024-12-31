---@type LazySpec
return {
  "anuvyklack/windows.nvim",
  event = "BufReadPost",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  keys = {
    { "<leader>wm", "<cmd>WindowsMaximize<cr>", desc = "Windows | Maximize" },
    { "<c-w>z", "<cmd>WindowsMaximize<cr>", desc = "Windows | Maximize" },
    { "<c-w>=", "<cmd>WindowsEqualize<cr>", desc = "Windows | Equalize" },
    { "<c-w>|", "<cmd>WindowsMaximizeHorizontally<cr>", desc = "Windows | Maximize Horizontally" },
    { "<c-w>_", "<cmd>WindowsMaximizeVertically<cr>", desc = "Windows | Maximize Vertically" },
  },
  config = function()
    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    require("windows").setup()
  end,
}

---@type LazySpec
return {
  "declancm/maximize.nvim",
  cmd = { "Maximize" },
  keys = {
    { "<leader>wm", "<cmd>Maximize<cr>", desc = "Maximize window" },
  },
  config = true,
}

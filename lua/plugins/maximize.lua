---@type LazySpec
return {
  "declancm/maximize.nvim",
  cmd = { "Maximize" },
  keys = {
    { "<localleader>wm", "<cmd>Maximize<cr>", desc = "Maximize window" },
  },
  config = true,
}

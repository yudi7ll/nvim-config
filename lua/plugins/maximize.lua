---@type LazySpec
return {
  "declancm/maximize.nvim",
  cmd = { "Maximize" },
  keys = {
    {
      "<leader>wm",
      function()
        require("maximize").toggle()
      end,
      desc = "Maximize | Toggle Maximize window",
    },
  },
  config = true,
}

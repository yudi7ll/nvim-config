---@type LazySpec
return {
  "gbprod/substitute.nvim",
  event = "BufReadPost",
  keys = {
    {
      "<leader>ps",
      function()
        require("substitute").operator()
      end,
      desc = "Substitute with motion",
    },
    {
      "<leader>pss",
      function()
        require("substitute").line()
      end,
      desc = "Substitute with line",
    },
    {
      "<leader>pS",
      function()
        require("substitute").eol()
      end,
      desc = "Substitute to end of line",
    },
    {
      "<leader>ps",
      function()
        require("substitute").visual()
      end,
      desc = "Substitute with selection",
      mode = "x",
    },
  },
  config = true,
}

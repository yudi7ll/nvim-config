---@type LazySpec
return {
  "gbprod/substitute.nvim",
  event = "BufReadPost",
  keys = {
    {
      "s",
      function()
        require("substitute").operator()
      end,
      desc = "Substitute with motion",
    },
    {
      "ss",
      function()
        require("substitute").line()
      end,
      desc = "Substitute with line",
    },
    {
      "S",
      function()
        require("substitute").eol()
      end,
      desc = "Substitute to end of line",
    },
    {
      "s",
      function()
        require("substitute").visual()
      end,
      desc = "Substitute with selection",
      mode = "x",
    },
  },
  config = true,
}

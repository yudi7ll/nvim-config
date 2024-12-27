return {
  {
    enabled = false,
    dir = "~/.config/nvim/lua/custom",
    lazy = false,
    name = "float_terminal",
    config = function()
      print "Loading float_terminal plugin..."
      require("custom.term").setup()
    end,
  },
}

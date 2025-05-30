---@type LazySpec
return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
  keys = {
    {
      "<leader>cj",
      function()
        require("treesj").join()
      end,
      desc = "Treesj | Join",
      mode = { "n", "x" },
    },
    {
      "<leader>cs",
      function()
        require("treesj").split()
      end,
      desc = "Treesj | Split",
      mode = { "n", "x" },
    },
    {
      "<leader>ct",
      function()
        require("treesj").toggle()
      end,
      desc = "Treesj | Toggle",
      mode = { "n", "x" },
    },
  },
  config = true,
}

-- @type LazySpec
return {
  "stevearc/aerial.nvim",
  cmd = { "AerialToggle", "AerialPrev", "AerialNext" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>oo", "<cmd>AerialToggle!<CR>", desc = "Aerial | Toggle" },
    { "{", "<cmd>AerialPrev<CR>", desc = "Aerial | Prev" },
    { "}", "<cmd>AerialNext<CR>", desc = "Aerial | Next" },
  },
  config = true,
}

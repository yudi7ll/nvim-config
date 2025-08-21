return {
  "pmizio/typescript-tools.nvim",
  requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  event = "BufReadPost",
  config = function()
    require("typescript-tools").setup {}
  end,
}

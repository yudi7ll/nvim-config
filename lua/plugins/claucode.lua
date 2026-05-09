---@type LazySpec
return {
  enabled = false,
  "avifenesh/claucode.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function()
    require("claucode").setup {
      mcp = {
        enabled = false,
      },
      auto_start_watcher = false,
      keymaps = {
        enable = true,
        prefix = "<leader>cc",
      },
    }
  end,
}

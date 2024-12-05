---@type LazySpec
return {
  {
    "jayden-chan/base46.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      local present, base46 = pcall(require, "base46")
      if not present then
        return
      end

      local theme = "onedark"
      local color_base = "base46"

      local theme_opts = {
        base = color_base,
        theme = theme,
        transparency = false,
      }

      base46.load_theme(theme_opts)
    end,
  },
  {
    "folke/tokyonight.nvim",
    enabled = true,
    specs = {
      "rose-pine/neovim",
    },
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
}

---@type LazySpec
return {
  "max397574/better-escape.nvim",
  event = "VeryLazy",
  config = function()
    require("better_escape").setup {
      mappings = {
        i = {
          k = {
            j = "<Esc>",
          },
        },
        c = {
          k = {
            j = "<Esc>",
          },
        },
        t = {
          k = {
            j = "<C-\\><C-n>",
          },
        },
        v = {
          k = {
            j = "<Esc>",
          },
        },
        s = {
          k = {
            j = "<Esc>",
          },
        },
      },
    }
  end,
}

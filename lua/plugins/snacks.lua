-- @type LazySpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dim = { enabled = true },
    explorer = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = {
      enabled = true,
      top_down = false,
      ---@type snacks.notifier.style
      style = "compact",
      margin = { top = 1, right = 1, bottom = 2 },
      gap = 1,
      timeout = 7000,
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
  },
}

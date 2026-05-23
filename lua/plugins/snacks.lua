-- @type LazySpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- init = function()
  --   local map = require "utils.map"
  --   map {
  --     {
  --       "<leader>sf",
  --       function()
  --         Snacks.picker.pick "files"
  --       end,
  --       desc = "Snacks | Pick Files",
  --     },
  --   }
  -- end,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    input = { enabled = true },
    -- picker = {
    --   enabled = true,
    --   win = {
    --     input = {
    --       keys = {
    --         -- ["<Esc>"] = { "close", mode = { "n", "i" } },
    --       },
    --     },
    --   },
    -- },
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
  },
}

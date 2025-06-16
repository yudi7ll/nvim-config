local map = require "utils.map"

---@type LazySpec
return {
  "Bekaboo/dropbar.nvim",
  event = "BufReadPost",
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  config = function()
    local dropbar_api = require "dropbar.api"

    map {
      { "<localleader>bs", dropbar_api.pick, desc = "Pick symbols in winbar" },
      { "<localleader>bp", dropbar_api.goto_context_start, desc = "Go to start of current context" },
      { "<localleader>bn", dropbar_api.select_next_context, desc = "Select next context" },
    }
  end,
}

---@type LazySpec
return {
  enabled = false,
  "stevearc/flow-coverage.nvim",
  event = "BufReadPost",
  config = function()
    require("flow").get_coverage_percent()
  end,
}

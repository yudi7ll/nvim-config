---@type LazySpec
return {
  "stevearc/flow-coverage.nvim",
  enabled = false,
  event = "BufReadPost",
  config = function()
    require("flow").get_coverage_percent()
  end,
}

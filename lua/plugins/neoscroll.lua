---@type LazySpec
return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  opts = {
    easing = "quadratic",
    performance_mods = true,
    duration_multiplier = 0.5,
    respect_scrolloff = true,
    stop_eof = false,
  },
}

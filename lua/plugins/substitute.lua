---@module 'lazy'
---@type LazySpec
return {
  "gbprod/substitute.nvim",
  event = "BufReadPost",
  keys = {
    { "s",  desc = "Substitute with motion" },
    { "ss", desc = "Substitute line" },
    { "S",  desc = "Substitute to end of line" },
    { "x",  desc = "Substitute in visual mode" }
  },
  config = true
}

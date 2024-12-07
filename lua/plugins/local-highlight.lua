---@type LazySpec
return {
  "tzachar/local-highlight.nvim",
  event = "BufReadPost",
  opts = {
    hlgroup = "CursorColumn",
  },
}

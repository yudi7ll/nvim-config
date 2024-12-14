---@type LazySpec
return {
  "tzachar/local-highlight.nvim",
  event = "BufReadPost",
  config = function()
    require("local-highlight").setup({
      hlgroup = "CursorColumn",
    })
  end
}

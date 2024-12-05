---@module 'lazy'
---@type LazySpec
return {
  "nvimdev/indentmini.nvim",
  enabled = false,
  event = "BufEnter",
  opts = {
    exclude = {
      "erlang",
      "markdown",
    },
  },
}

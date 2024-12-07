---@type LazySpec
return {
  "sontungexpt/better-diagnostic-virtual-text",
  event = "LspAttach",
  config = function()
    require("better-diagnostic-virtual-text").setup()
  end,
}

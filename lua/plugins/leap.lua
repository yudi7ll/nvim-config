---@type LazySpec
return {
  "ggandor/leap.nvim",
  event = "BufReadPost",
  config = function()
    require("leap").add_default_mappings()
  end,
}

---@type LazySpec
return {
  "tzachar/local-highlight.nvim",
  event = "BufReadPost",
  config = function()
    vim.cmd "highlight LocalHighlight guibg=#3e4451 guifg=None"
    require("local-highlight").setup {
      hlgroup = "LocalHighlight",
    }
  end,
}

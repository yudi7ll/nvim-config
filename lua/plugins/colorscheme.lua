-- @type LazySpec
return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = 'warmer'
    }
    require('onedark').load()
    vim.cmd([[colorscheme onedark]])
  end,
}

-- return {
--   "chriskempson/base16-vim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     _G.base16colorspace=256
--     vim.cmd([[colorscheme base16-default-dark]])
--   end
-- }

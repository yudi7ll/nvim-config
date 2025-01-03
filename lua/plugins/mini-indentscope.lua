local au = require "utils.au"

---@type LazySpec
return {
  "echasnovski/mini.indentscope",
  version = false,
  event = "BufReadPost",
  init = function()
    au("BufEnter", "*", function(args)
      local bufnr = args.buf
      local buftype = vim.bo[bufnr].buftype

      if buftype ~= "" then
        vim.b.miniindentscope_disable = true
      end
    end, "Disable miniindentscope on non-regular buffers")
  end,
  config = function()
    require("mini.indentscope").setup {
      symbol = "│",
    }
  end,
}

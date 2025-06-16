local au = require "utils.au"
local colors = require "colors"
local hloverride = require "utils.hloverride"

-- https://github.com/voldikss/vim-floaterm
---@type LazySpec
return {
  "voldikss/vim-floaterm",
  cmd = { "FloatermToggle", "FloatermNew", "FloatermKill", "FloatermNext", "FloatermPrev" },
  keys = {
    { "<localleader>m", "<cmd>FloatermToggle<cr>", mode = { "n", "t" }, desc = "Floaterm Toggle" },
    { "<localleader>tn", "<cmd>FloatermNew --autoclose=2<cr>", mode = { "n", "t" }, desc = "Floaterm New" },
    { "<localleader>tq", "<cmd>FloatermKill --autoclose=2<cr>", mode = { "n", "t" }, desc = "Floaterm Kill" },
    { "<localleader>tg", "<cmd>FloatermNew --autoclose=2 lazygit<cr>", mode = { "n", "t" }, desc = "Floaterm Lazygit" },
    {
      "<localleader>td",
      "<cmd>FloatermNew --autoclose=2 lazydocker<cr>",
      mode = { "n", "t" },
      desc = "Floaterm Lazydocker",
    },
    { "<c-,>", "<cmd>FloatermPrev<cr>", desc = "Floaterm Prev", mode = { "n", "t" } },
    { "<c-.>", "<cmd>FloatermNext<cr>", desc = "Floaterm Next", mode = { "n", "t" } },
  },
  init = function()
    au("VimResized", "*", function(args)
      local bufnr = args.buf
      local ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
      if ft == "floaterm" then
        vim.cmd "FloatermUpdate"
      end
    end, "Resize floaterm on VimResized")
  end,
  config = function()
    vim.g.floaterm_title = "Terminal [$1/$2]"
    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.9
    vim.g.floaterm_borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    vim.g.floaterm_autoinsert = 0

    hloverride {
      FloatermBorder = { fg = colors.border, bg = colors.base00 },
    }
  end,
}

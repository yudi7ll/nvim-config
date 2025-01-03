local colors = require "colors"
local hloverride = require "utils.hloverride"

-- https://github.com/voldikss/vim-floaterm
---@type LazySpec
return {
  "voldikss/vim-floaterm",
  cmd = { "FloatermToggle", "FloatermNew", "FloatermKill", "FloatermNext", "FloatermPrev" },
  keys = {
    { "<localleader>t,", "<cmd>FloatermToggle<cr>", mode = { "n", "t" }, desc = "Floaterm Toggle" },
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
  config = function()
    vim.g.floaterm_title = "Terminal [$1/$2]"
    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.9
    vim.g.floaterm_borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

    local floatermResized = vim.api.nvim_create_augroup("FloatermResized", { clear = true })
    vim.api.nvim_create_autocmd({ "VimResized" }, {
      callback = function(args)
        local bufnr = args.buf
        local ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
        if ft == "floaterm" then
          print "floaterm buffer updated"
          vim.cmd "FloatermUpdate"
        end
      end,
      group = floatermResized,
    })

    hloverride {
      FloatermBorder = { fg = colors.base0E, bg = colors.base00 },
    }
  end,
}

-- https://github.com/voldikss/vim-floaterm
---@type LazySpec
return {
  "voldikss/vim-floaterm",
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

    local floatermResized = vim.api.nvim_create_augroup("FloatermResized", { clear = true })
    vim.api.nvim_create_autocmd({ "VimResized" }, {
      command = ":FloatermUpdate<CR>",
      group = floatermResized,
    })
  end,
}

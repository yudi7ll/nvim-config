---@type NvPluginSpec
return {
"lewis6991/gitsigns.nvim",
  init = function()
    vim.keymap.set(
      "n",
      "<leader>gp",
      "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
      { desc = "Preview Hunk", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gj",
      "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
      { desc = "Next Hunk", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gk",
      "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
      { desc = "Prev Hunk", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gl",
      "<cmd>lua require 'gitsigns'.blame_line()<cr>",
      { desc = "Blame Line", silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gr",
      "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
      { desc = "Reset Hunk", silent = true }
    )
  end,
  event = "BufReadPost",
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "󰍵" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "│" },
    },
    on_attach = function() end,
  },
}

return {
  enabled = false,
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  init = function()
    -- Configuration for vim-tmux-navigator
    vim.g.tmux_navigator_no_mappings = true -- Use custom mappings below

    -- Optional: Disable when zooming
    vim.g.tmux_navigator_disable_when_zoomed = 1
  end,
  config = function()
    -- Custom key mappings for tmux navigator
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Map the standard navigation keys
    map("n", "<M-H>", ":TmuxNavigateLeft<CR>", opts)
    map("n", "<M-J>", ":TmuxNavigateDown<CR>", opts)
    map("n", "<M-K>", ":TmuxNavigateUp<CR>", opts)
    map("n", "<M-L>", ":TmuxNavigateRight<CR>", opts)
  end,
}

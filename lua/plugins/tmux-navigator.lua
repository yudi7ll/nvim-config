return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  init = function()
    -- Configuration for vim-tmux-navigator
    vim.g.tmux_navigator_no_mappings = true  -- Use custom mappings below

    -- Optional: Disable when zooming
    vim.g.tmux_navigator_disable_when_zoomed = 1
  end,
  config = function()
    -- Custom key mappings for tmux navigator
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Map the standard navigation keys
    map("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
    map("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
    map("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
    map("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)
  end,
}
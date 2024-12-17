---@type LazySpec
return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  ---@type Gitsigns.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    signs = {
      ---@diagnostic disable-next-line: missing-fields
      add = { text = " " },
      ---@diagnostic disable-next-line: missing-fields
      change = { text = " " },
      ---@diagnostic disable-next-line: missing-fields
      delete = { text = "󰍵 " },
      ---@diagnostic disable-next-line: missing-fields
      topdelete = { text = "‾" },
      ---@diagnostic disable-next-line: missing-fields
      changedelete = { text = "~" },
      ---@diagnostic disable-next-line: missing-fields
      untracked = { text = "│" },
    },
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 300,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local map = require "custom.map"

      map {
        { "<leader>gs", gs.stage_hunk, desc = "Gitsigns | Stage Hunk" },
        { "<leader>gr", gs.reset_hunk, desc = "Gitsigns | Reset Hunk" },
        {
          "<leader>gr",
          function()
            gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
          end,
          mode = "v",
          desc = "Gitsigns | Reset Selected Hunk",
        },
        {
          "<leader>gs",
          function()
            gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
          end,
          mode = "v",
          desc = "Gitsigns | Stage Selected Hunk",
        },
        { "<leader>gS", gs.stage_buffer, desc = "Gitsigns | Stage Buffer" },
        { "<leader>gu", gs.undo_stage_hunk, desc = "Gitsigns | Undo Stage Hunk" },
        { "<leader>gR", gs.reset_buffer, desc = "Gitsigns | Reset Buffer" },
        { "<leader>gp", gs.preview_hunk, desc = "Gitsigns | Preview Hunk" },
        {
          "<leader>gbb",
          function()
            gs.blame_line { full = true }
          end,
          desc = "Gitsigns | Blame Line",
        },
        { "<leader>gbt", gs.toggle_current_line_blame, desc = "Gitsigns | Toggle Current Line Blame" },
        { "<leader>gd", gs.diffthis, desc = "Gitsigns | Diff This" },
        {
          "<leader>gD",
          function()
            gs.diffthis "~"
          end,
          desc = "Gitsigns | Diff This",
        },
        { "<leader>gt", gs.toggle_deleted, desc = "Gitsigns | Toggle Deleted" },
        { "ih", ":<C-U>Gitsigns select_hunk<CR>", mode = { "o", "x" }, desc = "Gitsigns | Select Hunk" },
      }
    end,
  },
}

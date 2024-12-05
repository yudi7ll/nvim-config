---@type LazySpec
return {
  "lewis6991/gitsigns.nvim",
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
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
      delay = 300,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc, noremap = true })
      end

      map("n", "<leader>gs", gs.stage_hunk, "Gitsigns | Stage Hunk")
      map("n", "<leader>gr", gs.reset_hunk, "Gitsigns | Reset Hunk")
      map("v", "<leader>gr", function()
        gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end, "Gitsigns | Reset Selected Hunk")
      map("v", "<leader>gs", function()
        gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end, "Gitsigns | Stage Selected Hunk")
      map("n", "<leader>gS", gs.stage_buffer, "Gitsigns | Stage Buffer")
      map("n", "<leader>gu", gs.undo_stage_hunk, "Gitsigns | Undo Stage Hunk")
      map("n", "<leader>gR", gs.reset_buffer, "Gitsigns | Reset Buffer")
      map("n", "<leader>gp", gs.preview_hunk, "Gitsigns | Preview Hunk")
      map("n", "<leader>gbb", function()
        gs.blame_line { full = true }
      end, "Gitsigns | Blame Line")
      map("n", "<leader>gbt", gs.toggle_current_line_blame, "Gitsigns | Toggle Current Line Blame")
      map("n", "<leader>gd", gs.diffthis, "Gitsigns | Diff This")
      map("n", "<leader>gD", function()
        gs.diffthis "~"
      end, "Gitsigns | Diff This")
      map("n", "<leader>gt", gs.toggle_deleted, "Gitsigns | Toggle Deleted")

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns | Select Hunk")
    end,
  },
}

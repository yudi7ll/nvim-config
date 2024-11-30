---@type LazySpec
return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "BufReadPost",
  init = function()
    vim.o.foldcolumn = "0" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    local map = vim.keymap.set

    map("n", "<localleader>fc", "zc", { desc = "Close folds" })
    map("n", "<localleader>fo", "zo", { desc = "Open folds" })
    map("n", "<localleader>fr", require("ufo").openFoldsExceptKinds, { desc = "UFO | Open folds except kinds" })
    map("n", "<localleader>fR", require("ufo").openAllFolds, { desc = "UFO | Open all folds" })
    map("n", "<localleader>fm", require("ufo").closeFoldsWith, { desc = "UFO | Close folds with" })
    map("n", "<localleader>fM", require("ufo").closeAllFolds, { desc = "UFO | Close all folds" })
    map("n", "K", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "UFO | Peek folded lines under cursor" })

    -- { "<localleader>fc", "zc", desc = "Close folds" },
    -- { "<localleader>fo", "zo", desc = "Open folds" },
    -- { "<localleader>fr", require("ufo").openFoldsExceptKinds, desc = "UFO | Open folds except kinds" },
    -- { "<localleader>fR", require("ufo").openAllFolds, desc = "UFO | Open all folds" },
    -- { "<localleader>fm", require("ufo").closeFoldsWith, desc = "UFO | Close folds with" },
    -- { "<localleader>fM", require("ufo").closeAllFolds, desc = "UFO | Close all folds" },
    -- {
    --   "K",
    --   function()
    --     local winid = require("ufo").peekFoldedLinesUnderCursor()
    --     if not winid then
    --       vim.lsp.buf.hover()
    --     end
    --   end,
    --   desc = "UFO | Peek folded lines under cursor",
    -- },
  end,
  opts = {
    open_fold_hl_timeout = 150,
    close_fold_kinds_in_ft = { "imports", "comment" },
    preview = {
      win_config = {
        border = { "", "─", "", "", "", "─", "", "" },
        winhighlight = "NormalBg:Folded",
        winblend = 0,
      },
      mappings = {
        scrollU = "<C-u>",
        scrollD = "<C-d>",
        jumpTop = "[",
        jumpBot = "]",
      },
    },
    provider_selector = function(bufnr, filetype, buftype)
      return { "lsp", "indent" }
    end,
  },
}

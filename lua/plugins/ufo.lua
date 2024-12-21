---@type LazySpec
return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "BufReadPost",
  init = function()
    local map = require "custom.map"

    vim.o.foldcolumn = "0" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    map {
      { "<localleader>fc", "zc", mode = { "n", "v", "x" }, desc = "Close folds" },
      { "<localleader>fo", "zo", mode = { "n", "v", "x" }, desc = "Open folds" },
      { "<localleader>fO", "zO", desc = "Open all folds" },
      { "<localleader>fr", require("ufo").openFoldsExceptKinds, desc = "UFO | Open folds except kinds" },
      { "<localleader>fR", require("ufo").openAllFolds, desc = "UFO | Open all folds" },
      { "<localleader>fm", require("ufo").closeFoldsWith, desc = "UFO | Close folds with" },
      { "<localleader>fM", require("ufo").closeAllFolds, desc = "UFO | Close all folds" },
      {
        "<localleader>fk",
        function()
          require("ufo").peekFoldedLinesUnderCursor()
        end,
        desc = "UFO | Peek folded lines under cursor",
      },
    }
  end,
  config = function()
    require("ufo").setup {
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
        return { "treesitter", "indent" }
      end,
    }
  end,
}

local nmap = require("common.utils").nmap

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
nmap("<localleader>fR", require("ufo").openAllFolds)
nmap("<localleader>fM", require("ufo").closeAllFolds)
nmap("<localleader>fo", "zo")
nmap("<localleader>fO", "zO")
nmap("<localleader>fc", "zc")
nmap("<localleader>fC", "zC")
nmap("<localleader>fr", require("ufo").openFoldsExceptKinds)
nmap("<localleader>fm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
nmap("K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end)

require("ufo").setup({
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
})

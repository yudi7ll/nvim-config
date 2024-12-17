---@type LazySpec
return {
  "akinsho/git-conflict.nvim",
  version = "*",
  event = "VeryLazy",
  cmd = {
    "GitConflictChooseOurs",
    "GitConflictChooseTheirs",
    "GitConflictChooseBoth",
    "GitConflictChooseNone",
    "GitConflictNextConflict",
    "GitConflictPrevConflict",
    "GitConflictListQf",
  },
  config = true,
}

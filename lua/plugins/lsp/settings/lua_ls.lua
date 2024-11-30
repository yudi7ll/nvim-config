return {
  settings = {
    Lua = {
      semantic = {
        enable = false,
      },
      hint = { enable = true },
      diagnostics = {
        globals = { "vim" },
      },
      telemetry = { enable = false },
      workspace = {
        library = vim.tbl_deep_extend("force", {
          vim.api.nvim_get_runtime_file("", true), -- Include Neovim's runtime files
        }, vim.fn.glob(vim.fn.stdpath("data") .. "/lazy/*/lua", true, true)),
        checkThirdParty = false,
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

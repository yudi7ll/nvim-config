local lspconfig = require("lspconfig")
local opts = require("modules.nvim-lspconfig.opts")

lspconfig.tailwindcss.setup(vim.tbl_extend("force", opts, {
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "classList", "ngClass" },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
      validate = true,
    },
  },
}))

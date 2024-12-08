local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")

lspconfig.tailwindcss.setup(vim.tbl_deep_extend("force", configs, {
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

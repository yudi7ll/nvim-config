local lspconfig = require('lspconfig')
local utils = require('common.utils')
local opts = utils.merge(require('modules.nvim-lspconfig.opts'))

lspconfig.tailwindcss.setup(opts {
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
        recommendedVariantOrder = "warning"
      },
      validate = true
    }
  }
})

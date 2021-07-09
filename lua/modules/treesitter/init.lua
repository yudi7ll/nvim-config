require('nvim-treesitter.configs').setup ({
  ensure_installed = "maintained",
  ignore_install = { "html" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

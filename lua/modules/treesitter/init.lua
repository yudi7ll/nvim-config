require('nvim-treesitter.configs').setup ({
  ensure_installed = "maintained",
  ignore_install = {'python'},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

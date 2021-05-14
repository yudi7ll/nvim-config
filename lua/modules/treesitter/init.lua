require('nvim-treesitter.configs').setup ({
  ensure_installed = "maintained",
  ignore_install = {'php'},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    max_file_lines = 1000,
  },
})

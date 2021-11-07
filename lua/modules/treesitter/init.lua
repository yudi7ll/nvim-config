require('nvim-treesitter.configs').setup ({
  ensure_installed = "maintained",
  ignore_install = { "html" },
  highlight = {
    enable = true,
    disable = { "html" },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commenting = {
    enable = true,
    javascript = {
      __default = '// %s',
      jsx_element = '{/* %s */}',
      jsx_fragment = '{/* %s */}',
      jsx_attribute = '// %s',
      comment = '// %s'
    }
  },
})

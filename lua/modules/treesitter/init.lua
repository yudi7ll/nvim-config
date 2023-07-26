local nmap = require("common.utils").nmap

nmap("<leader>th", "<CMD>TSHighlightCapturesUnderCursor<CR>")

require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "comment",
    "commonlisp",
    "cpp",
    "css",
    "dockerfile",
    "gitattributes",
    "gitignore",
    "go",
    "graphql",
    "hjson",
    "html",
    "http",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "php",
    "phpdoc",
    "prisma",
    "query",
    "regex",
    "scss",
    "sql",
    "svelte",
    "todotxt",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function(_, bufnr)
      return vim.api.nvim_buf_line_count(bufnr) > 10000
    end,
  },
  indent = {
    enable = true,
    disable = { "yaml" },
  },
  context_commenting = {
    enable = true,
    javascript = {
      __default = "// %s",
      jsx_element = "{/* %s */}",
      jsx_fragment = "{/* %s */}",
      jsx_attribute = "// %s",
      comment = "// %s",
    },
  },
})

vim.cmd([[
  set nofen
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]])

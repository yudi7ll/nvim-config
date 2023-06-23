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
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
  },
  autotag = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
})

vim.cmd([[
  set nofen
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]])

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    ---@diagnostic disable-next-line: missing-fields
    { "windwp/nvim-ts-autotag", config = true },
  },
  event = "BufReadPost",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter.configs").setup {
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
      ignore_install = {},
      modules = {},
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        -- disable = function(_, bufnr)
        --   return vim.api.nvim_buf_line_count(bufnr) > 10000
        -- end,
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
      -- rainbow = {
      --   enable = true,
      --   -- list of languages you want to disable the plugin for
      --   disable = { "jsx", "cpp" },
      --   -- Which query to use for finding delimiters
      --   query = "rainbow-parens",
      --   -- Highlight the entire buffer all at once
      --   strategy = require("ts-rainbow").strategy.global,
      -- },
    }
  end,
}

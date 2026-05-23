---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    ---@diagnostic disable-next-line: missing-fields
    { enabled = false, "windwp/nvim-ts-autotag", config = true },
  },
  lazy = false,
  -- event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  branch = "main",
  init = function()
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
  config = function()
    require("nvim-treesitter.install").prefer_git = true
    require("nvim-treesitter").setup {
      ignore_install = {},
      modules = {},
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
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
    }

    require("nvim-treesitter").install {
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
      "tmux",
    }

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("AutoStartTreesitter", { clear = true }),
      pattern = "*",
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}

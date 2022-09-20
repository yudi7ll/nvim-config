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
    "help",
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
    "vue",
    "yaml",
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
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
  textsubjects = {
    enable = true,
    prev_selection = ",", -- (Optional) keymap to select the previous selection
    keymaps = {
      ["."] = "textsubjects-smart",
      [";"] = "textsubjects-container-outer",
      ["i;"] = "textsubjects-container-inner",
    },
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
        ["ic"] = {
          query = "@class.inner",
          desc = "Select inner part of a class region",
        },
      },
      -- You can choose the select mode (default is charwise 'v')
      selection_modes = {
        ["@parameter.outer"] = "v", -- charwise
        ["@function.outer"] = "V", -- linewise
        ["@class.outer"] = "<c-v>", -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding xor succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      include_surrounding_whitespace = true,
    },
  },
})

vim.cmd([[
  set nofen
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]])

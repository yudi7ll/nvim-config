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
    disable = function(_, bufnr)
      return vim.api.nvim_buf_line_count(bufnr) > 1000
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

-- temporary solution for new highlight
local hl = function(group, opts)
  opts.default = true
  vim.api.nvim_set_hl(0, group, opts)
end

-- Misc {{{
hl("@comment", { link = "Comment" })
-- hl('@error', {link = 'Error'})
hl("@none", { bg = "NONE", fg = "NONE" })
hl("@preproc", { link = "PreProc" })
hl("@define", { link = "Define" })
hl("@operator", { link = "Operator" })
-- }}}

-- Punctuation {{{
hl("@punctuation.delimiter", { link = "Delimiter" })
hl("@punctuation.bracket", { link = "Delimiter" })
hl("@punctuation.special", { link = "Delimiter" })
-- }}}

-- Literals {{{
hl("@string", { link = "String" })
hl("@string.regex", { link = "String" })
hl("@string.escape", { link = "SpecialChar" })
hl("@string.special", { link = "SpecialChar" })

hl("@character", { link = "Character" })
hl("@character.special", { link = "SpecialChar" })

hl("@boolean", { link = "Boolean" })
hl("@number", { link = "Number" })
hl("@float", { link = "Float" })
-- }}}

-- Functions {{{
hl("@function", { link = "Function" })
hl("@function.call", { link = "Function" })
hl("@function.builtin", { link = "Special" })
hl("@function.macro", { link = "Macro" })

hl("@method", { link = "Function" })
hl("@method.call", { link = "Function" })

hl("@constructor", { link = "Special" })
hl("@parameter", { link = "Identifier" })
-- }}}

-- Keywords {{{
hl("@keyword", { link = "Keyword" })
hl("@keyword.function", { link = "Keyword" })
hl("@keyword.operator", { link = "Keyword" })
hl("@keyword.return", { link = "Keyword" })

hl("@conditional", { link = "Conditional" })
hl("@repeat", { link = "Repeat" })
hl("@debug", { link = "Debug" })
hl("@label", { link = "Label" })
hl("@include", { link = "Include" })
hl("@exception", { link = "Exception" })
-- }}}

-- Types {{{
hl("@type", { link = "Type" })
hl("@type.builtin", { link = "Type" })
hl("@type.qualifier", { link = "Type" })
hl("@type.definition", { link = "Typedef" })

hl("@storageclass", { link = "StorageClass" })
hl("@attribute", { link = "PreProc" })
hl("@field", { link = "Identifier" })
hl("@property", { link = "Identifier" })
-- }}}

-- Identifiers {{{
hl("@variable", { link = "Normal" })
hl("@variable.builtin", { link = "Special" })

hl("@constant", { link = "Constant" })
hl("@constant.builtin", { link = "Special" })
hl("@constant.macro", { link = "Define" })

hl("@namespace", { link = "Include" })
hl("@symbol", { link = "Identifier" })
-- }}}

-- Text {{{
hl("@text", { link = "Normal" })
hl("@text.strong", { bold = true })
hl("@text.emphasis", { italic = true })
hl("@text.underline", { underline = true })
hl("@text.strike", { strikethrough = true })
hl("@text.title", { link = "Title" })
hl("@text.literal", { link = "String" })
hl("@text.uri", { link = "Underlined" })
hl("@text.math", { link = "Special" })
hl("@text.environment", { link = "Macro" })
hl("@text.environment.name", { link = "Type" })
hl("@text.reference", { link = "Constant" })

hl("@text.todo", { link = "Todo" })
hl("@text.note", { link = "SpecialComment" })
hl("@text.warning", { link = "WarningMsg" })
hl("@text.danger", { link = "ErrorMsg" })
-- }}}

-- Tags {{{
hl("@tag", { link = "Tag" })
hl("@tag.attribute", { link = "Identifier" })
hl("@tag.delimiter", { link = "Delimiter" })
-- }}}

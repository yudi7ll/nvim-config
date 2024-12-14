---@type LazySpec
return {
  {
    enabled = false,
    "jayden-chan/base46.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local present, base46 = pcall(require, "base46")
      if not present then
        return
      end

      local theme = "onedark"
      local color_base = "base46"

      local theme_opts = {
        base = color_base,
        theme = theme,
        transparency = false,
      }

      base46.load_theme(theme_opts)
    end,
  },
  {
    "folke/tokyonight.nvim",
    specs = {
      "rose-pine/neovim",
      {
        enabled = false,
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
          require("gruvbox").setup {
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
              strings = true,
              emphasis = true,
              comments = true,
              operators = false,
              folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "hard", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            dim_inactive = false,
            transparent_mode = false,
            overrides = {
              SignColumn = { bg = "NONE" },
              CursorLineNr = { fg = "NONE" },
            },
          }
        end,
      },
      {
        "sainnhe/gruvbox-material",
        priority = 1000,
        init = function()
          vim.g.gruvbox_material_background = "hard"
        end,
      },
    },
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd "colorscheme tokyonight"
    end,
  },
  {
    enabled = false,
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      terminalColors = false,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          -- Popular plugins that open floats will link to NormalFloat by default;
          -- set their background accordingly if you wish to keep them dark and borderless
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd [[colorscheme kanagawa]]
    end,
  },
}

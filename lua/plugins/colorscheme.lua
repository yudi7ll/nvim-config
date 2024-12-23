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
    enabled = false,
    "folke/tokyonight.nvim",
    specs = {
      "rose-pine/neovim",
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
  {
    "echasnovski/mini.base16",
    lazy = false,
    version = false,
    priority = 1000,
    config = function()
      require("mini.base16").setup {
        -- Table with names from `base00` to `base0F` and values being strings of
        -- HEX colors with format "#RRGGBB". NOTE: this should be explicitly
        -- supplied in `setup()`.
        palette = {
          base00 = "#1e222a",
          -- base01 = "#2d3139",
          base01 = "#23272f",
          base02 = "#3e4451",
          base03 = "#545862",
          base04 = "#565c64",
          base05 = "#abb2bf",
          base06 = "#b6bdca",
          base07 = "#c8ccd4",
          base08 = "#e06c75",
          base09 = "#d19a66",
          base0A = "#e5c07b",
          base0B = "#98c379",
          base0C = "#56b6c2",
          base0D = "#61afef",
          base0E = "#c678dd",
          base0F = "#be5046",
        },

        -- Whether to support cterm colors. Can be boolean, `nil` (same as
        -- `false`), or table with cterm colors. See `setup()` documentation for
        -- more information.
        use_cterm = nil,

        -- Plugin integrations. Use `default = false` to disable all integrations.
        -- Also can be set per plugin (see |MiniBase16.config|).
        plugins = { default = true },
      }

      vim.g.mini_base16_use_cache = true
      vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
      vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    end,
  },
}

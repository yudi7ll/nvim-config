local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "yudi7ll/saria-one",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme saria-one]])
    end,
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  -- lsp & utilities
  { "neovim/nvim-lspconfig" },
  { "onsails/lspkind.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "tamago324/nlsp-settings.nvim" },
  { "klen/nvim-config-local" },
  { "vigoux/notifier.nvim" },
  { "tzachar/local-highlight.nvim" },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  -- flutter
  { "dart-lang/dart-vim-plugin" },
  { "akinsho/flutter-tools.nvim" },
  -- completion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "folke/neodev.nvim" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "lukas-reineke/cmp-under-comparator" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "b0o/schemastore.nvim" },
  { "davidsierradz/cmp-conventionalcommits" },
  { "yioneko/nvim-vtsls" },
  -- wip: debugging
  -- { "mfussenegger/nvim-dap" },
  -- { "rcarriga/nvim-dap-ui" },
  -- { "mxsdev/nvim-dap-vscode-js" },
  -- git
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("modules.gitsigns")
    end,
  },
  { "rhysd/conflict-marker.vim" },
  -- ui
  { "RishabhRD/nvim-lsputils", dependencies = { "RishabhRD/popfix" } },
  { "CosmicNvim/cosmic-ui", dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" } },
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/bufferline.nvim" },
  { "voldikss/vim-floaterm" },
  { "ziontee113/color-picker.nvim", config = true },
  -- other
  { "dstein64/vim-startuptime" },
  { "windwp/nvim-autopairs", lazy = true, config = true },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
          {
            "s1n7ax/nvim-window-picker",
            version = "2.*",
            config = function()
              require("window-picker").setup({
                filter_rules = {
                  include_current_win = false,
                  autoselect_one = true,
                  -- filter using buffer options
                  bo = {
                    -- if the file type is one of following, the window will be ignored
                    filetype = { "neo-tree", "neo-tree-popup", "notify" },
                    -- if the buffer type is one of following, the window will be ignored
                    buftype = { "terminal", "quickfix" },
                  },
                },
              })
            end,
          },
        },
      },
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  { "terrortylor/nvim-comment" },
  { "tpope/vim-surround" },
  { "tpope/vim-sleuth" },
  { "folke/which-key.nvim" },
  { "andweeb/presence.nvim", config = true },
  { "SmiteshP/nvim-navic" },
  { "utilyre/barbecue.nvim", config = true, dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" } },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "Snikimonkd/telescope-git-conflicts.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
  { "junegunn/vim-slash" },
  { "tpope/vim-repeat" },
  { "Aasim-A/scrollEOF.nvim", config = true },
  { "petertriho/nvim-scrollbar" },
  { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = [[require('modules.harpoon')]],
  },
  {
    "k2589/LLuMinate.nvim",
    config = function()
      require("lluminate").setup()
    end,
  },
  -- treesitter
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "HiPhish/nvim-ts-rainbow2" },
  -- Highlighting
  { "jwalton512/vim-blade", ft = "blade" },
  { "nikvdp/ejs-syntax", ft = "ejs" },
  { "chr4/nginx.vim", ft = "nginx" },
  { "styled-components/vim-styled-components", ft = { "javascriptreact", "typescriptreact" } },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = false, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Highlighting mode.  'background'|'foreground'|'virtualtext'
        mode = "background", -- Set the display mode
        -- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True is same as normal
        -- True is same as normal
        tailwind = "both", -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
        -- Virtualtext character to use
        virtualtext = "■",
        -- Display virtualtext inline with color
        virtualtext_inline = false,
        -- Virtualtext highlight mode: 'background'|'foreground'
        virtualtext_mode = "foreground",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false,
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
      -- Boolean | List of usercommands to enable
      user_commands = true, -- Enable all or some usercommands
    },
  },
  {
    "tzachar/highlight-undo.nvim",
    lazy = true,
    keys = { { "u" }, { "<C-r>" } },
    config = true,
  },
})

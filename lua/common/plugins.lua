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
  { "yudi7ll/saria-one" },
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
  -- wip: debugging
  -- { "mfussenegger/nvim-dap" },
  -- { "rcarriga/nvim-dap-ui" },
  -- { "mxsdev/nvim-dap-vscode-js" },
  -- git
  { "lewis6991/gitsigns.nvim" },
  { "rhysd/conflict-marker.vim" },
  -- ui
  { "RishabhRD/nvim-lsputils", dependencies = { "RishabhRD/popfix" } },
  { "CosmicNvim/cosmic-ui", dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" } },
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/bufferline.nvim" },
  { "voldikss/vim-floaterm" },
  { "ziontee113/color-picker.nvim", config = true },
  -- other
  { "nvim-tree/nvim-web-devicons" },
  { "windwp/nvim-autopairs" },
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
  { "terrortylor/nvim-comment" },
  { "tpope/vim-surround" },
  { "tpope/vim-sleuth" },
  { "folke/which-key.nvim" },
  { "andweeb/presence.nvim", config = true },
  { "SmiteshP/nvim-navic" },
  { "utilyre/barbecue.nvim", config = true, dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" } },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "junegunn/vim-slash" },
  { "tpope/vim-repeat" },
  { "Aasim-A/scrollEOF.nvim", config = true },
  { "petertriho/nvim-scrollbar" },
  { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
  -- treesitter
  { "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  -- { "HiPhish/nvim-ts-rainbow2" },
  -- Highlighting
  { "jwalton512/vim-blade", ft = "blade" },
  { "nikvdp/ejs-syntax", ft = "ejs" },
  { "chr4/nginx.vim", ft = "nginx" },
  { "styled-components/vim-styled-components", ft = { "javascriptreact", "typescriptreact" } },
  { "NvChad/nvim-colorizer.lua" },
})

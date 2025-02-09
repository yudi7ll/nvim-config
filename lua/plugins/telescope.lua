local colors = require "colors"
local hloverride = require "utils.hloverride"

---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "Snikimonkd/telescope-git-conflicts.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  event = "VeryLazy",
  keys = {
    -- { "<c-p>", "<cmd>Telescope find_files<cr>", desc = "Telescope | Find Files" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Telescope | Find Files" },
    { "<leader>st", "<cmd>Telescope<cr>", desc = "Telescope" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Telescope | Live Grep" },
    { "<leader>sh", "<cmd>Telescope highlights<cr>", desc = "Telescope | Highlights" },
    { "<leader>gc", "<cmd>Telescope conflicts<cr>", desc = "Telescope Git Conflicts" },
    { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Telescope | Resume" },
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    telescope.setup {
      pickers = {
        oldfiles = {
          prompt_title = "Recent Files",
        },
        find_files = {
          theme = "dropdown",
          hidden = true,
        },
        live_grep = {
          theme = "ivy",
        },
        current_buffer_fuzzy_find = {
          theme = "dropdown",
        },
        lsp_definitions = {
          theme = "dropdown",
        },
        lsp_type_definitions = {
          theme = "dropdown",
        },
        lsp_implementations = {
          theme = "dropdown",
        },
        lsp_references = {
          theme = "cursor",
          initial_mode = "normal",
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<A-j>"] = actions.move_selection_next,
            ["<A-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
        file_ignore_patterns = { "node_modules", ".git/" },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
    }

    telescope.load_extension "fzf"
    telescope.load_extension "conflicts"

    hloverride {
      TelescopeNormal = { bg = colors.base00 },
      TelescopeBorder = { fg = colors.border, bg = colors.base00 },
      TelescopePromptBorder = { fg = colors.border, bg = colors.base00 },
      TelescopePromptNormal = { fg = colors.base05, bg = colors.base00 },
      TelescopePromptPrefix = { fg = colors.base0D },
    }
  end,
}

local colors = require "colors"
local hloverride = require "utils.hloverride"

---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "Snikimonkd/telescope-git-conflicts.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
  },
  event = "VeryLazy",
  keys = {
    -- { "<c-p>", "<cmd>Telescope find_files<cr>", desc = "Telescope | Find Files" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Telescope | Find Files" },
    { "<leader>st", "<cmd>Telescope<cr>", desc = "Telescope" },
    {
      "<leader>sg",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Telescope | Live Grep",
    },
    { "<leader>sh", "<cmd>Telescope highlights<cr>", desc = "Telescope | Highlights" },
    { "<leader>gc", "<cmd>Telescope conflicts<cr>", desc = "Telescope Git Conflicts" },
    { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Telescope | Resume" },
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local lga_actions = require "telescope-live-grep-args.actions"

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
        live_grep_args = {
          auto_quoting = true,
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt { postfix = " --iglob " },
              -- freeze the current list and start a fuzzy search in the frozen list
              ["<C-space>"] = lga_actions.to_fuzzy_refine,
            },
          },
        },
      },
    }

    telescope.load_extension "fzf"
    telescope.load_extension "conflicts"
    telescope.load_extension "live_grep_args"

    hloverride {
      TelescopeNormal = { bg = colors.base00 },
      TelescopeBorder = { fg = colors.border, bg = colors.base00 },
      TelescopePromptBorder = { fg = colors.border, bg = colors.base00 },
      TelescopePromptNormal = { fg = colors.base05, bg = colors.base00 },
      TelescopePromptPrefix = { fg = colors.base0D },
    }
  end,
}

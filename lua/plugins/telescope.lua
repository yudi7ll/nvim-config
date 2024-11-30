---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "Snikimonkd/telescope-git-conflicts.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<c-p>", "<cmd>Telescope find_files<cr>" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>" },
    { "<leader>sh", "<cmd>Telescope highlights<cr>" },
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
  end,
}

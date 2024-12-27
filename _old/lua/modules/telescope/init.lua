local telescope = require("telescope")
local actions = require("telescope.actions")
local utils = require("common.utils")
local nmap = utils.nmap

telescope.setup({
  pickers = {
    find_files = {
      theme = "dropdown",
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
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("conflicts")

nmap("<C-/>", "<CMD>Telescope current_buffer_fuzzy_find<CR>")
nmap("<C-p>", "<CMD>Telescope find_files<CR>")
nmap("<leader>ss", "<CMD>Telescope grep_string<CR>")
nmap("<leader>sg", "<CMD>Telescope live_grep<CR>")
nmap("<leader>sh", "<CMD>Telescope highlights<CR>")
nmap("<leader>st", "<CMD>Telescope<CR>")
nmap("<leader>sk", "<CMD>Telescope keymaps<CR>")

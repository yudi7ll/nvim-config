local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
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
})

local utils = require("common.utils")
local nmap = utils.nmap

nmap("<C-/>", "<CMD>Telescope current_buffer_fuzzy_find<CR>")
nmap("<C-p>", "<CMD>Telescope find_files<CR>")
nmap("<leader>ss", "<CMD>Telescope grep_string<CR>")
nmap("<leader>sg", "<CMD>Telescope live_grep<CR>")
nmap("<leader>sh", "<CMD>Telescope highlights<CR>")
nmap("<leader>st", "<CMD>Telescope<CR>")
nmap("<leader>sk", "<CMD>Telescope keymaps<CR>")

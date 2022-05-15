local utils = require("common.utils")
local nmap = utils.nmap

nmap("<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
nmap("<C-f>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_refresh_wait = 500
vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "",
		unmerged = "",
		renamed = "➜",
		untracked = "",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
	lsp = {
		hint = "",
		info = "",
		warning = "",
		error = "",
	},
}

local list = {
	{ key = "l", action = "edit" },
	{ key = "<CR>", action = "cd" },
	{ key = "v", action = "vsplit" },
	{ key = "s", action = "split" },
	{ key = "t", action = "tabnew" },
	{ key = "<BS>", action = "close_node" },
	{ key = "h", action = "close_node" },
	{ key = "<Tab>", action = "preview" },
	{ key = "I", action = "toggle_ignored" },
	{ key = "H", action = "toggle_dotfiles" },
	{ key = "R", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "trash" },
	{ key = "r", action = "rename" },
	{ key = "<C-r>", action = "full_rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "[c", action = "prev_git_item" },
	{ key = "]c", action = "next_git_item" },
	{ key = "-", action = "dir_up" },
	{ key = "q", action = "close" },
}

require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = false,
	diagnostics = {
		enable = false, -- crash
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},

	filters = {
		dotfiles = true,
		custom = {},
	},

	git = {
		enable = true,
		ignore = false,
		timeout = 1000,
	},

	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},

	system_open = {
		cmd = nil,
		args = {},
	},

	view = {
		width = 38,
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = list,
		},
	},

	trash = {
		cmd = "trash",
		require_confirm = true,
	},

  actions = {
    change_dir = {
      enable = true,
      global = false
    },
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = false
      }
    }
  },

  renderer = {
    indent_markers = {
      enable = false
    }
  }
})

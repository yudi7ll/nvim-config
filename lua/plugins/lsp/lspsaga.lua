---@type LazySpec
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons",     -- optional
  },
  ---@type LspsagaConfig
  opts = {
    beacon = {
      enable = true,
      frequency = 7,
    },
    preview = {
      lines_above = 0,
      lines_below = 10,
    },

    code_action = {
      num_shortcut = true,
      keys = {
        quit = "q",
        exec = "<CR>",
      },
    },

    scroll_preview = {
      scroll_down = "<C-f>",
      scroll_up = "<C-b>",
    },
    request_timeout = 2000,

    lightbulb = {
      enable = true,
      enable_in_insert = true,
      sign = true,
      sign_priority = 40,
      virtual_text = false,
    },

    rename = {
      quit = "q",
      exec = "<CR>",
      in_select = true,
    },

    finder = {
      edit = { "o", "<CR>" },
      vsplit = "s",
      split = "i",
      tabe = "t",
      quit = { "q", "<ESC>" },
    },

    diagnostic = {
      show_layout = "float",
      jump_num_shortcut = true,
      auto_preview = false,
      diagnostic_only_current = false,
      keys = {
        exec_action = "o",
        quit = "q",
        toggle_or_jump = "<CR>",
        quit_in_show = { "q", "<ESC>" },
      },
    },

    symbol_in_winbar = {
      enable = true,
      separator = "  ",
      hide_keyword = true,
      show_file = true,
      folder_level = 0,
      color_mode = true,
      delay = 300,
    },

    definition = {
      edit = "<C-c>o",
      vsplit = "<C-c>v",
      split = "<C-c>i",
      tabe = "<C-c>t",
      quit = "q",
      close = "<Esc>",
    },

    ui = {
      theme = "round",
      border = "rounded",
      winblend = 0,
      expand = "",
      collaspe = "",
      preview = " ",
      code_action = "󱧣 ",
      diagnostic = "🐞",
      hover = " ",
      kind = {},
    },

    outline = {
      win_position = "right",
      win_with = "",
      win_width = 30,
      show_detail = true,
      auto_preview = true,
      auto_refresh = true,
      auto_close = true,
      custom_sort = nil,
      keys = {
        jump = "o",
        expand_collaspe = "u",
        quit = "q",
      },
    },

    callhierarchy = {
      show_detail = false,
      keys = {
        edit = "e",
        vsplit = "s",
        split = "i",
        tabe = "t",
        jump = "o",
        quit = "q",
        expand_collaspe = "u",
      },
    },
  },
}

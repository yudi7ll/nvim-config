---@type LazySpec
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    -- { "smjonas/inc-rename.nvim", config = true },
  },
  keys = {
    {
      "<leader>nh",
      "<cmd>Noice pick<cr>",
      desc = "Noice | Notification History",
    },
    {
      "<leader>nl",
      "<cmd>Noice last<cr>",
      desc = "Noice | Show the last message in a popup",
    },
    {
      "<leader>nd",
      "<cmd>Noice dismiss<cr>",
      desc = "Noice | Dismiss Notification",
    },
    {
      "<leader>ntd",
      "<cmd>NoiceDisable<cr>",
      desc = "Noice | Disable",
    },
    {
      "<leader>nte",
      "<cmd>NoiceEnable<cr>",
      desc = "Noice | Enable",
    },
  },
  config = function()
    require("noice").setup {
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
        progress = {
          enabled = true,
        },
        hover = {
          enabled = true,
          silent = true,
        },
      },
      notify = {
        enabled = true,
      },
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = "mini", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "mini", -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = false, -- view for search count messages. Set to `false` to disable
      },
      popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
        ---@type 'nui'|'cmp'
        backend = "cmp", -- backend to use to show regular cmdline completions
        ---@type NoicePopupmenuItemKind|false
        -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
        -- kind_icons = {}, -- set to `false` to disable icons
      },
    }
  end,
}

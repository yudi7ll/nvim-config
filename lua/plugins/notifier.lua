---@type LazySpec
return {
  {
    enabled = false,
    "vigoux/notifier.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>nn", "<cmd>NotifierReplay<cr>", desc = "Notifier | Replay" },
      { "<leader>nc", "<cmd>NotifierClear<cr>", desc = "Notifier | Clear" },
    },
    opts = {
      ignore_messages = {}, -- Ignore message from LSP servers with this name
      components = { -- Order of the components to draw from top to bottom (first nvim notifications, then lsp)
        "nvim", -- Nvim notifications (vim.notify and such)
        "lsp", -- LSP status updates
      },
      notify = {
        clear_time = 10000, -- Time in milliseconds before removing a vim.notify notification, 0 to make them sticky
        min_level = vim.log.levels.INFO, -- Minimum log level to print the notification
      },
      component_name_recall = true, -- Whether to prefix the title of the notification by the component name
      zindex = 10, -- The zindex to use for the floating window. Note that changing this value may cause visual bugs with other windows overlapping the notifier window.
    },
  },
  {
    enabled = false,
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    config = function()
      require("fidget").setup {
        progress = {
          display = {
            done_ttl = 5,
          },
        },
        notification = {
          override_vim_notify = true,
          view = {
            stack_upwards = false,
          },
          window = {
            normal_hl = "Comment", -- Base highlight group in the notification window
            winblend = 0, -- Background color opacity in the notification window
            border = "none", -- Border around the notification window
            zindex = 45, -- Stacking priority of the notification window
            max_width = 0, -- Maximum width of the notification window
            max_height = 0, -- Maximum height of the notification window
            x_padding = 1, -- Padding from right edge of window boundary
            y_padding = 0, -- Padding from bottom edge of window boundary
            align = "bottom", -- How to align the notification window
            relative = "editor", -- What the notification window position is relative to
          },
        },
      }
    end,
  },
}

local colors = require "colors"
local hloverride = require "utils.hloverride"

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
    {
      "rcarriga/nvim-notify",
      config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("notify").setup {
          fps = 60,
          top_down = false,
          render = "minimal",
          stages = "fade_in_slide_out",
          level = vim.log.levels.DEBUG,
          on_open = function(win)
            vim.api.nvim_win_set_config(win, { zindex = 200 })
          end,
        }
      end,
    },
    -- { "smjonas/inc-rename.nvim", config = true },
  },
  keys = {
    { "<leader>nh",  "<cmd>Noice pick<cr>",    desc = "Noice | Notification History" },
    { "<leader>nl",  "<cmd>Noice last<cr>",    desc = "Noice | Show the last message in a popup" },
    { "<leader>nd",  "<cmd>Noice dismiss<cr>", desc = "Noice | Dismiss Notification" },
    { "<leader>ntd", "<cmd>NoiceDisable<cr>",  desc = "Noice | Disable" },
    { "<leader>nte", "<cmd>NoiceEnable<cr>",   desc = "Noice | Enable" },
    {
      "<Down>",
      function()
        if not require("noice.lsp").scroll(4) then
          ---@diagnostic disable-next-line: redundant-return-value
          return "<Down>"
        end
      end,
      desc = "Noice | Scroll forward",
      mode = { "n", "i", "s" },
      expr = true,
    },
    {
      "<Up>",
      function()
        if not require("noice.lsp").scroll(-4) then
          ---@diagnostic disable-next-line: redundant-return-value
          return "<Up>"
        end
      end,
      desc = "Noice | Scroll backward",
      mode = { "n", "i", "s" },
      expr = true,
    },
  },
  config = function()
    require("noice").setup {
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
      views = {
        mini = {
          backend = "mini",
          relative = "win",
          align = "messages-right",
          timeout = 2000,
          reverse = true,
          focusable = false,
          position = {
            row = -3,
            col = "100%",
            -- col = 0,
          },
          size = {
            width = "auto",
            height = "auto",
            max_height = 10,
          },
          border = {
            style = "none",
          },
          zindex = 10,
          win_options = {
            winbar = "",
            foldenable = false,
            winblend = 30,
            winhighlight = {
              Normal = "NoiceMini",
              IncSearch = "",
              CurSearch = "",
              Search = "",
            },
          },
        },
      },
      ---@type NoiceRouteConfig[]
      routes = {
        -- {
        --   filter = {
        --     event = "lsp",
        --     cond = function()
        --       return vim.fn.win_gettype() ~= "popup" -- Disable in terminal windows
        --     end,
        --   },
        --   view = "mini",
        -- },
      },
      notify = {
        -- Noice can be used as `vim.notify` so you can route any notification like other messages
        -- Notification messages have their level and other properties set.
        -- event is always "notify" and kind can be any log level as a string
        -- The default routes will forward notifications to nvim-notify
        -- Benefit of using Noice for this is the routing and consistent history view
        enabled = true,
        view = "notify",
      },
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true,            -- enables the Noice messages UI
        view = "notify",           -- default view for messages
        view_error = "notify",     -- view for errors
        view_warn = "notify",      -- view for warnings
        view_history = "messages", -- view for :messages
        view_search = false,       -- view for search count messages. Set to `false` to disable
      },
      popupmenu = {
        enabled = true,  -- enables the Noice popupmenu UI
        ---@type 'nui'|'cmp'
        backend = "nui", -- backend to use to show regular cmdline completions
        ---@type NoicePopupmenuItemKind|false
        -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
        -- kind_icons = {}, -- set to `false` to disable icons
      },
      health = {
        checker = true, -- Disable if you don't want health checks to run
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
          -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
          -- See the section on formatting for more details on how to customize.
          --- @type NoiceFormat|string
          format = "lsp_progress",
          --- @type NoiceFormat|string
          format_done = "lsp_progress_done",
          throttle = 1000 / 30, -- frequency to update lsp progress message
          view = "mini",
        },
        hover = {
          enabled = true,
          silent = true,
        },
      },
    }

    hloverride {
      NoiceScrollbar = { bg = colors.base00, fg = colors.border },
      NoiceScrollbarThumb = { bg = colors.border, fg = colors.border },
    }
  end,
}

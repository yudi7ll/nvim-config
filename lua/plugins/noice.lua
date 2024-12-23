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
    -- "rcarriga/nvim-notify",
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
      "<leader>nr",
      "<cmd>Noice dismiss<cr>",
      desc = "Noice | Dismiss Notification",
    },
    {
      "<leader>nd",
      "<cmd>NoiceDisable<cr>",
      desc = "Noice | Disable",
    },
    {
      "<leader>ne",
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
          enabled = false,
        },
        hover = {
          enabled = true,
          silent = false,
        },
      },
      messages = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
    }
  end,
}

---@type LazySpec
return {
  "akinsho/bufferline.nvim",
  -- dir = "~/Dev/neovim-plugins/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<c-q>", "<cmd>bp <bar> bd #<cr>", desc = "Bufferline | Close Buffer" },
    { "<a-q>", "<cmd>bp <bar> bd #<cr>", desc = "Bufferline | Close Buffer" },
    { "<a-,>", "<cmd>BufferLineCyclePrev<cr>", desc = "Bufferline | Cycle Left" },
    { "<a-.>", "<cmd>BufferLineCycleNext<cr>", desc = "Bufferline | Cycle Right" },
    {
      "<a-a>",
      function()
        local curbufnr = vim.api.nvim_get_current_buf()
        local buflist = vim.api.nvim_list_bufs()
        for _, bufnr in ipairs(buflist) do
          if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, "bufpersist") ~= 1) then
            vim.cmd("bd " .. tostring(bufnr))
          end
        end
      end,
    },
  },
  cmd = {
    "BufferLineCyclePrev",
    "BufferLineCycleNext",
  },
  config = function()
    local static_buffers = require "utils.static-buffers"
    local stray_buf = nil

    -- local get_index_of_value = function(lists, value)
    --   local index = nil
    --
    --   if type(lists) == "table" then
    --     for i, v in ipairs(lists) do
    --       if type(v) == "table" and v.name == value then
    --         index = i
    --         break
    --       end
    --     end
    --   end
    --
    --   return index
    -- end

    require("bufferline").setup {
      options = {
        pin_feature = true,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level)
          local icon = level:match "error" and " " or " "
          return " " .. icon .. count
        end,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = false,
        separator_style = "thick",
        offsets = {
          {
            filetype = "NvimTree",
            text = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
            text_align = "center",
          },
          {
            filetype = "neo-tree",
            text = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
            text_align = "center",
          },
        },
        numbers = function(opts)
          local bufname = static_buffers.get_buffer_name(opts.id)
          if type(static_buffers.get_all()[bufname]) == "table" then
            return "󰐃 "
          end

          return ""
        end,
        custom_filter = function(buf_number)
          local current_buf = vim.api.nvim_get_current_buf()
          local buf_name = static_buffers.get_buffer_name(buf_number)
          local cached_buffers = static_buffers.get_all()

          if stray_buf == buf_name or cached_buffers[buf_name] then
            return true
          end

          if buf_number == current_buf then
            stray_buf = buf_name
            return true
          end

          return false
        end,
        sort_by = function(buffer_a, buffer_b)
          return not not static_buffers.get_all()[buffer_a.name] or not not static_buffers.get_all()[buffer_b.name]
        end,
      },
    }

    vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#0f1115" })
  end,
}

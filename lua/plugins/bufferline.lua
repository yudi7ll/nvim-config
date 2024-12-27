---@type LazySpec
-- return {
--   "akinsho/bufferline.nvim",
--   dependencies = { "theprimeagen/harpoon" },
--   event = "VeryLazy",
--   config = function()
--     local bufferline = require "bufferline"
--
--     local function harpoon_lists()
--       local harpoon = require "harpoon"
--       local list = harpoon:list().items
--       local buffers = {}
--
--       for _, mark in ipairs(list) do
--         if mark.value ~= "" then
--           table.insert(buffers, mark.value)
--         end
--       end
--
--       return buffers
--     end
--
--     local function get_index_of_value(table, value)
--       local index = nil
--       for i, v in pairs(table) do
--         if v == value then
--           index = i
--           break
--         end
--       end
--
--       return index
--     end
--
--     bufferline.setup {
--       options = {
--         show_close_icon = false,
--         show_buffer_close_icons = false,
--         numbers = function(buffer)
--           local buf_name = vim.fn.bufname(buffer.id)
--           local harpoon_buffers = harpoon_lists()
--
--           return get_index_of_value(harpoon_buffers, buf_name) or ""
--         end,
--         custom_filter = function(buf)
--           local harpoon_buffers = harpoon_lists()
--           local buf_name = vim.fn.bufname(buf)
--
--           for _, buffer in ipairs(harpoon_buffers) do
--             if buffer == buf_name then
--               return true
--             end
--           end
--         end,
--         ---@diagnostic disable-next-line: assign-type-mismatch
--         sort_by = function(buffer_a, buffer_b)
--           -- get the harpoon buffers and the names of the buffers
--           local harpoon_buffers = harpoon_lists()
--           local buf_name_a = vim.fn.bufname(buffer_a.id)
--           local buf_name_b = vim.fn.bufname(buffer_b.id)
--
--           local idx_a = get_index_of_value(harpoon_buffers, buf_name_a)
--           local idx_b = get_index_of_value(harpoon_buffers, buf_name_b)
--
--           return idx_a < idx_b
--         end,
--         diagnostics = "nvim_lsp",
--         always_show_bufferline = false,
--       },
--     }
--
--     local sync_opened_buffer_with_harpoon = vim.api.nvim_create_augroup("SyncBufferWithHarpoon", { clear = true })
--     vim.api.nvim_create_autocmd({ "User" }, {
--       pattern = "HarpoonListUpdated",
--       callback = function()
--         vim.defer_fn(function()
--           for _, buf in ipairs(harpoon_lists()) do
--             vim.api.nvim_list_bufs()
--             vim.cmd("badd " .. buf)
--           end
--         end, 100)
--       end,
--       group = sync_opened_buffer_with_harpoon,
--     })
--   end,
-- }

---@type LazySpec
return {
  -- "akinsho/bufferline.nvim",
  dir = "~/Dev/neovim-plugins/bufferline.nvim",
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
    vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#0f1115" })
    require("bufferline").setup {
      highlights = {
        fill = {
          -- bg = "#111111",
        },
      },
      options = {
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
        sort_by = "insert_at_end",
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
      },
    }
  end,
}

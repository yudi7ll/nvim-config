---@type LazySpec
return {
  enabled = false,
  -- "theprimeagen/harpoon",
  -- branch = "harpoon2",
  dir = "~/Dev/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>ha",
      function()
        local harpoon = require "harpoon"
        harpoon:list():add()
        vim.api.nvim_exec_autocmds("User", { pattern = "HarpoonListUpdated" })
      end,
      desc = "Harpoon | Add file",
    },
    {
      "<a-a>",
      function()
        local harpoon = require "harpoon"
        harpoon:list():add()
        vim.api.nvim_exec_autocmds("User", { pattern = "HarpoonListUpdated" })
      end,
      desc = "Harpoon | Add file",
    },
    {
      "<leader>hd",
      function()
        local harpoon = require "harpoon"
        harpoon:list():remove()
        vim.api.nvim_exec_autocmds("User", { pattern = "HarpoonListUpdated" })

        harpoon:list():prev()
      end,
      desc = "Harpoon | Remove file",
    },
    {
      "<a-q>",
      function()
        local harpoon = require "harpoon"
        harpoon:list():remove_at(2)
        vim.api.nvim_exec_autocmds("User", { pattern = "HarpoonListUpdated" })

        harpoon:list():prev()
      end,
      desc = "Harpoon | Remove file",
    },
    {
      "<leader>ht",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
        vim.api.nvim_exec_autocmds("User", { pattern = "HarpoonListUpdated" })
      end,
      desc = "Harpoon | Toggle quick menu",
    },
    {
      "<a-,>",
      function()
        local harpoon = require "harpoon"
        local action = function()
          harpoon:list():prev()
        end

        if action() == false then
          action()
        end
      end,
      desc = "Harpoon | Previous file",
    },
    {
      "<a-.>",
      function()
        local harpoon = require "harpoon"
        local action = function()
          harpoon:list():next()
        end

        if action() == false then
          action()
        end
      end,
      desc = "Harpoon | Next file",
    },
  },
  config = function()
    -- vim.g.harpoon_log_level = "debug"
    require("harpoon"):setup {
      settings = {
        save_on_toggle = true,
        save_on_change = true,
        mark_branch = true,
      },
      -- default = {
      --
      --   ---@param obj HarpoonListItem
      --   ---@return string
      --   encode = function(obj)
      --     -- Remove nil values from the object before encoding
      --     local cleaned_obj = {}
      --     for key, value in pairs(obj) do
      --       if value ~= nil then
      --         cleaned_obj[key] = value
      --       end
      --     end
      --     return vim.json.encode(cleaned_obj)
      --   end,
      --
      --   ---@param str string
      --   ---@return HarpoonListItem
      --   decode = function(str)
      --     local obj = vim.json.decode(str)
      --
      --     -- Remove nil values from the decoded object
      --     local cleaned_obj = {}
      --     for key, value in pairs(obj) do
      --       if value ~= nil then
      --         cleaned_obj[key] = value
      --       end
      --     end
      --
      --     return cleaned_obj
      --   end,
      -- },
    }
  end,
}

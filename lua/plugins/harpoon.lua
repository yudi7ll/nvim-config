---@type LazySpec
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require "harpoon"
    local map = require "custom.map"
    harpoon:setup {}

    map {
      {
        "<leader>ha",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon | Add to list",
      },
      {
        "<leader>ht",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon | Toggle quick menu",
      },
      {
        "<leader>hn",
        function()
          harpoon:list():next()
        end,
        desc = "Harpoon | Next",
      },
      {
        "<c-l>",
        function()
          harpoon:list():next()
        end,
        desc = "Harpoon | Next",
      },
      {
        "<leader>hp",
        function()
          harpoon:list():prev()
        end,
        desc = "Harpoon | Previous",
      },
      {
        "<c-h>",
        function()
          harpoon:list():prev()
        end,
        desc = "Harpoon | Previous",
      },
    }
  end,
}

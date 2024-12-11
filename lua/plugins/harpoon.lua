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
    harpoon:setup {}

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Harpoon | Add to list" })
    vim.keymap.set("n", "<leader>ht", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon | Toggle quick menu" })
    vim.keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end, { desc = "Harpoon | Next" })
    vim.keymap.set("n", "<c-l>", function()
      harpoon:list():next()
    end, { desc = "Harpoon | Next" })
    vim.keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end, { desc = "Harpoon | Previous" })
    vim.keymap.set("n", "<c-h>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon | Previous" })
  end,
}

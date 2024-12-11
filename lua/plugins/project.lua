---@type LazySpec
return {
  "ahmedkhalf/project.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>pf",
      function()
        require("telescope").extensions.projects.projects {}
      end,
      desc = "Project | Open project",
    },
  },
  config = function()
    require("project_nvim").setup {}
    require("telescope").load_extension "projects"
  end,
}

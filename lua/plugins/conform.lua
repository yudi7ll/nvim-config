---@type NvPluginSpec
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
    },

    format_on_save = function (bufnr)
    if not _G.format_on_save then
        return
      end

      return {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      } 
    end,
  },
}

require('lspconfig').html.setup {
  file_types = { "html", "php" },
  init_options = {
    configurationSection = { "html", "css", "javascript", "php" },
    embeddedLanguages = {
      css = true,
      javascript = true,
      php = true,
    }
  }
}

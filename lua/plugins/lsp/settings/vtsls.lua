return {
  settings = {
    init_options = {
      hostinfo = "neovim",
    },
    compilerOptions = {
      module = "commonjs",
      target = "es6",
      allowJs = true,
      checkJs = false,
    },
    exclude = {
      "node_modules",
      "lib",
      "dist",
    },
    typescript = {
      tsserver = {
        maxTsServerMemory = 10000,
      },
    },
    javascript = {
      tsserver = {
        maxTsServerMemory = 10000,
      },
    },
    vtsls = {
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
  },
}

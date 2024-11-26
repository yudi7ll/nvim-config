return {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
            languages = { "vue" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
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
  },
}

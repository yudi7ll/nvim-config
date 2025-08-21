local vtslsDefaultConfig = require("vtsls").lspconfig
return vim.tbl_deep_extend("force", vtslsDefaultConfig, {
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
    init_options = {
      hostinfo = "neovim",
    },
    compilerOptions = {
      module = "commonjs",
      target = "es6",
      allowJs = true,
      checkJs = false,
      maxNodeModuleJsDepth = false,
    },
    exclude = {
      "node_modules",
      "lib",
      "dist",
      "**/*.js",
      "flow-typed",
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
    },
  },
})

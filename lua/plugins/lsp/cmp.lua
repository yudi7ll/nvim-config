---@diagnostic disable: missing-fields
---@type LazySpec
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "davidsierradz/cmp-conventionalcommits",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "SergioRibera/cmp-dotenv",
    "hrsh7th/cmp-nvim-lua",
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      dependencies = {
        "Bilal2453/luvit-meta", -- optional `vim.uv` typings
      },
      opts = {
        library = {
          -- Library items can be absolute paths
          -- "~/projects/my-awesome-lib",
          -- Or relative, which means they will be resolved as a plugin
          -- When relative, you can also provide a path to the library in the plugin dir
          "luvit-meta/library", -- see below
        },
      },
    },
    {
      "hrsh7th/cmp-cmdline",
      config = function()
        local cmdline_mappings = vim.tbl_extend("force", {}, require("cmp").mapping.preset.cmdline(), {
          ["<Tab>"] = {
            c = require("cmp").mapping.confirm { select = false },
          },
        })

        require("cmp").setup.cmdline(":", {
          mapping = cmdline_mappings,
          sources = {
            { name = "cmdline" },
          },
        })
      end,
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
      },
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    {
      "monkoose/neocodeium",
      enabled = false,
      config = function()
        local neocodeium = require "neocodeium"
        neocodeium.setup()
        vim.keymap.set("i", "<A-f>", neocodeium.accept)
      end,
    },
    {
      "supermaven-inc/supermaven-nvim",
      opts = {
        keymaps = {
          accept_suggestion = "<A-f>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        ignore_filetypes = { cpp = true }, -- or { "cpp", }
        color = {
          suggestion_color = "#ffffff",
          cterm = 244,
        },
        log_level = "info", -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
        condition = function()
          return false
        end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
      },
    },
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    local lspkind = require "lspkind"
    local cmp_kinds = {
      File = " ",
      Module = " ",
      Namespace = " ",
      Package = " ",
      Class = " ",
      Method = " ",
      Property = " ",
      Field = " ",
      Constructor = " ",
      Enum = " ",
      Interface = " ",
      Function = " ",
      Variable = " ",
      Constant = " ",
      String = " ",
      Number = " ",
      Boolean = " ",
      Array = " ",
      Object = " ",
      Key = " ",
      Null = " ",
      EnumMember = " ",
      Struct = " ",
      Event = " ",
      Operator = " ",
      TypeParameter = " ",
      Color = " ",
      Folder = " ",
      Keyword = "󰌆 ",
      Text = " ",
      Unit = " ",
      Value = "󰎠 ",
      Snippet = " ",
      Reference = "󰈇 ",
    }
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end
    require("luasnip.loaders.from_vscode").lazy_load()

    require("cmp").setup {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm { select = true }
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end),

        ["<A-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<A-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },

      sources = cmp.config.sources {
        { name = "lazydev" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "dotenv" },
        { name = "nvim_lsp_signature_help" },
        { name = "path" },
        { name = "conventionalcommits" },
        { name = "buffer", keyword_length = 3 },
      },
      formatting = {
        format = lspkind.cmp_format {
          preset = "codicons",
          maxwidth = 50,
          symbol_map = cmp_kinds,
          mode = "symbol_text",
        },
      },
      experimental = {
        ghost_text = false,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }
  end,
}

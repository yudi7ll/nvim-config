local map = require "utils.map"
local hloverride = require "utils.hloverride"
local colors = require "colors"

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
    -- "hrsh7th/cmp-nvim-lsp-signature-help",
    "SergioRibera/cmp-dotenv",
    { "hrsh7th/cmp-nvim-lua", ft = "lua" },
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
      keys = { { ":" } },
      config = function()
        local cmp = require "cmp"
        local mapping = require "cmp.config.mapping"

        cmp.setup.cmdline(":", {
          completion = {
            completeopt = "menu,menuone,noinsert",
          },
          -- sample: https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/mapping.lua
          mapping = mapping.preset.cmdline {
            ["<A-j>"] = mapping.preset.cmdline()["<Tab>"],
            ["<C-j>"] = mapping.preset.cmdline()["<Tab>"],
            ["<A-k>"] = mapping.preset.cmdline()["<S-Tab>"],
            ["<C-k>"] = mapping.preset.cmdline()["<S-Tab>"],
            ["<Tab>"] = {
              c = function()
                if cmp.visible() then
                  cmp.confirm { select = true }
                else
                  cmp.complete()
                end
              end,
            },
          },
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
      enabled = false,
      "monkoose/neocodeium",
      config = function()
        local neocodeium = require "neocodeium"
        neocodeium.setup {
          -- If `false`, then would not start windsurf server (disabled state)
          -- You can manually enable it at runtime with `:NeoCodeium enable`
          enabled = true,
          -- When set to `true`, autosuggestions are disabled.
          -- Use `require'neodecodeium'.cycle_or_complete()` to show suggestions manually
          manual = false,
          -- Information about the API server to use
          -- Set to `false` to disable showing the number of suggestions label in the line number column
          show_label = true,
          -- Set to `true` to enable suggestions debounce
          debounce = false,
          -- Maximum number of lines parsed from loaded buffers (current buffer always fully parsed)
          -- Set to `0` to disable parsing non-current buffers (may lower suggestion quality)
          -- Set it to `-1` to parse all lines
          max_lines = 10000,
          -- Set to `true` to disable some non-important messages, like "NeoCodeium: server started..."
          silent = true,
          -- Set to `false` to enable suggestions in special buftypes, like `nofile` etc.
          disable_in_special_buftypes = true,
          -- Sets default log level. One of "trace", "debug", "info", "warn", "error"
          log_level = "warn",
          -- Set `enabled` to `true` to enable single line mode.
          -- In this mode, multi-line suggestions would collapse into a single line and only
          -- shows full lines when on the end of the suggested (accepted) line.
          -- So it is less distracting and works better with other completion plugins.
          single_line = {
            enabled = false,
            label = "...", -- Label indicating that there is multi-line suggestion.
          },
          -- Set to a function that returns `true` if a buffer should be enabled
          -- and `false` if the buffer should be disabled
          -- You can still enable disabled by this option buffer with `:NeoCodeium enable_buffer`
          filter = function(bufnr)
            return true
          end,
          -- Set to `false` to disable suggestions in buffers with specific filetypes
          -- You can still enable disabled by this option buffer with `:NeoCodeium enable_buffer`
          filetypes = {
            help = false,
            gitcommit = false,
            gitrebase = false,
            ["."] = false,
          },
        }
        vim.keymap.set("i", "<A-f>", neocodeium.accept)

        hloverride {
          NeoCodeiumSuggestion = {
            fg = colors.base03,
          },
        }
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
    {
      enabled = false,
      "github/copilot.vim",
      config = function()
        vim.g.copilot_no_tab_map = true
        map {
          {
            "<A-f>",
            'copilot#Accept("\\<CR>")',
            desc = "Accept copilot suggestion",
            mode = "i",
            expr = true,
            replace_keycodes = false,
          },
          -- TODO: add dismiss, next, previous, mapping
        }
      end,
    },
    {
      enabled = false,
      "milanglacier/minuet-ai.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        -- optional, if you are using virtual-text frontend, nvim-cmp is not
        -- required.
        "hrsh7th/nvim-cmp",
        -- optional, if you are using virtual-text frontend, blink is not required.
        "Saghen/blink.cmp",
      },
      config = function()
        require("minuet").setup {
          provider = "openai_fim_compatible",
          n_completions = 1, -- recommend for local model for resource saving
          -- I recommend beginning with a small context window size and incrementally
          -- expanding it, depending on your local computing power. A context window
          -- of 512, serves as an good starting point to estimate your computing
          -- power. Once you have a reliable estimate of your local computing power,
          -- you should adjust the context window to a larger value.
          context_window = 512,
          provider_options = {
            openai_fim_compatible = {
              -- For Windows users, TERM may not be present in environment variables.
              -- Consider using APPDATA instead.
              api_key = "TERM",
              name = "Ollama",
              end_point = "http://localhost:7869/v1/completions",
              model = "qwen2.5-coder:7b",
              optional = {
                max_tokens = 56,
                top_p = 0.9,
              },
            },
          },
          virtualtext = {
            auto_trigger_ft = {},
            keymap = {
              -- accept whole completion
              accept = "<A-f>",
              -- accept one line
              accept_line = "<A-c-f>",
              -- accept n lines (prompts for number)
              -- e.g. "A-z 2 CR" will accept 2 lines
              accept_n_lines = "<A-z>",
              -- Cycle to prev completion item, or manually invoke completion
              prev = "<A-[>",
              -- Cycle to next completion item, or manually invoke completion
              next = "<A-]>",
              dismiss = "<A-e>",
            },
          },
        }
      end,
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
        end, { "i", "c" }),

        ["<A-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s", "c" }),

        ["<A-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s", "c" }),
      },

      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "lazydev" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "dotenv" },
        -- { name = "nvim_lsp_signature_help" },
        { name = "path" },
        { name = "conventionalcommits" },
        { name = "buffer", keyword_length = 3, max_item_count = 5 },
      },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        expandable_indicator = true,
        format = lspkind.cmp_format {
          preset = "codicons",
          maxwidth = 50,
          symbol_map = cmp_kinds,
          mode = "symbol_text",
        },
      },
      experimental = {
        ghost_text = true,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    }
  end,
}

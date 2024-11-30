---@type LazySpec
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  init = function()
    vim.keymap.set("n", "<leader>oa", function()
      vim.g.toggle_cmp = not vim.g.toggle_cmp
      if vim.g.toggle_cmp then
        vim.notify("Toggled On", vim.log.levels.INFO, { title = "Autocomplete" })
      else
        vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Autocomplete" })
      end
    end, { desc = "Options | Toggle Autocomplete" })
  end,
  opts = function ()
    local luasnip = require("luasnip")
    local cmp = require("cmp")
    -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local lspkind = require("lspkind")
    local cmp_kinds = require("lib.lsp-icons")
    local WIDE_HEIGHT = 40
    -- local handlers = require("nvim-autopairs.completion.handlers")

    local select_next_item = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      end
    end, { "i", "s" })

    local select_prev_item = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { "i", "s" })

    local scroll_docs_down = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" })
    local scroll_docs_up = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" })

    local confirm_selection = cmp.mapping(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior, select = true })
      elseif has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end)

    local cr = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and has_words_before() then
          abort()
        end

        fallback()
      end,
    })

    local refresh = cmp.mapping(function()
      if has_words_before() then
        cmp.complete()
      end
    end)

    return {
      completion = {
        completeopt = "menu,menuone,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<A-j>"] = select_next_item,
        ["<C-j>"] = select_next_item,
        ["<A-k>"] = select_prev_item,
        ["<C-k>"] = select_prev_item,
        ["<Down>"] = scroll_docs_down,
        ["<Up>"] = scroll_docs_up,
        ["<Tab>"] = confirm_selection,
        ["<CR>"] = cr,
        ["<C-Space>"] = refresh,
        ["<C-e>"] = abort,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "nvim_lsp_signature_help" },
        { name = "null-ls" },
      }, {
        { name = "path" },
        { name = "conventionalcommits" },
        { name = "buffer" },
      }),
      formatting = {
        format = lspkind.cmp_format({
          preset = "codicons",
          maxwidth = 50,
          symbol_map = cmp_kinds,
        }),
      },
      experimental = {
        ghost_text = true,
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.offset,
          cmp.config.compare.locality,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.order,
          cmp.config.compare.length,
          require("cmp-under-comparator").under,
          cmp.config.compare.kind,
        },
      },
      view = {
        entries = "native",
      },

      window = {
        completion = {
          border = { "", "", "", "", "", "", "", "" },
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
          col_offset = 5,
        },
        documentation = {
          max_height = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
          max_width = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
          border = { "", "", "", " ", "", "", "", " " },
          winhighlight = "FloatBorder:NormalFloat",
          side_padding = 5,
        },
      },
    }
  end,
  -- config = function(_, opts)
    --   -- table.insert(opts.sources, 2, { name = "codeium" })
    --   -- table.insert(opts.sources, 1, { name = "supermaven" })
    --
    --   opts.mapping = vim.tbl_extend("force", {}, opts.mapping, {
      --     -- You can add here new mappings.
      --   })
      --
      --   opts.completion["completeopt"] = "menu,menuone,noselect" -- disable autoselect
      --
      --   opts.enabled = function()
        --     return (vim.g.toggle_cmp and vim.bo.buftype == "")
        --   end
        --
        --   require("luasnip").filetype_extend("javascriptreact", { "html" })
        --   require("luasnip").filetype_extend("typescriptreact", { "html" })
        --   require("luasnip").filetype_extend("svelte", { "html" })
        --   require("luasnip").filetype_extend("vue", { "html" })
        --   require("luasnip").filetype_extend("php", { "html" })
        --   require("luasnip").filetype_extend("javascript", { "javascriptreact" })
        --   require("luasnip").filetype_extend("typescript", { "typescriptreact" })
        --
        --   --NOTE: add border for cmp window
        --   if vim.g.border_enabled then
        --     opts.window = {
          --       completion = require("cmp").config.window.bordered(),
          --       documentation = require("cmp").config.window.bordered(),
          --     }
          --   end
          --
          --   require("cmp").setup(opts)
          -- end,
          dependencies = {
            -- For Rust
            {
              "saecki/crates.nvim",
              tag = "v0.4.0",
              opts = {},
            },
            -- Commandline completions
            {
              "hrsh7th/cmp-cmdline",
              config = function()
                local cmdline_mappings = vim.tbl_extend("force", {}, require("cmp").mapping.preset.cmdline(), {
                  -- ["<CR>"] = { c = require("cmp").mapping.confirm { select = true } },
                })

                require("cmp").setup.cmdline(":", {
                  mapping = cmdline_mappings,
                  sources = {
                    { name = "cmdline" },
                  },
                })
              end,
            },
            -- AI Autocomplete
            {
              "Exafunction/codeium.nvim",
              enabled = false,
              opts = {
                enable_chat = true,
              },
            },
            {
              "supermaven-inc/supermaven-nvim",
              -- commit = "df3ecf7",
              -- commit = "40bde487fe31723cdd180843b182f70c6a991226",
              event = "BufReadPost",
              opts = {
                disable_keymaps = false,
                disable_inline_completion = false,
                keymaps = {
                  accept_suggestion = "<A-f>",
                  clear_suggestion = "<Nop>",
                  accept_word = "<A-w>",
                },
              },
            },
            {
              "L3MON4D3/LuaSnip",
              dependencies = "rafamadriz/friendly-snippets",
              build = "make install_jsregexp",
            },
          },
        }

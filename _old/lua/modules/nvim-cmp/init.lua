require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require("luasnip")
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local lspkind = require("lspkind")
local cmp_kinds = require("lib.lsp-icons")
local WIDE_HEIGHT = 40
local handlers = require("nvim-autopairs.completion.handlers")

local abort = cmp.mapping.abort()
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

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

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert",
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
})

cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done({
    filetypes = {
      -- "*" is a alias to all filetypes
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"],
        },
      },
      lua = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          ---@param char string
          ---@param item table item completion
          ---@param bufnr number buffer number
          ---@param rules table
          ---@param commit_character table<string>
          handler = function(char, item, bufnr, rules, commit_character)
            -- Your handler function. Inpect with print(vim.inspect{char, item, bufnr, rules, commit_character})
          end,
        },
      },
      -- Disable for tex
      tex = false,
    },
  })
)

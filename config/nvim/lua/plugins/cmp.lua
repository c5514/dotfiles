local cmp = require('cmp')
local luasnip = require('luasnip')
local function in_mathzone()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
local function get_bufnrs()
  local buf_size_limit = 100 * 1024 -- 10KB size limit (reduced for LaTeX)
  local bufs = vim.api.nvim_list_bufs()
  local valid_bufs = {}
  for _, buf in ipairs(bufs) do
    if vim.api.nvim_buf_is_loaded(buf) and
        vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) < buf_size_limit then
      table.insert(valid_bufs, buf)
    end
  end
  return valid_bufs
end
local kind_icons = {
  Namespace = "󰌗",
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰆧",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈚",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰊄",
  Table = "",
  Object = "󰅩",
  Tag = "",
  Array = "[]",
  Boolean = "",
  Number = "",
  Null = "󰟢",
  String = "󰉿",
  Calendar = "",
  Watch = "󰥔",
  Package = "",
  Copilot = "",
  Codeium = "",
  TabNine = "",
}

cmp.setup {
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  preselect = cmp.PreselectMode.None,
  sources = {
    {
      name = 'luasnip',
      keywordLength = 3,
      priority = 1000,
      max_item_count = 10,
      option = { get_bufnrs = get_bufnrs }
    },
    {
      name = 'vimtex',
      priority = 900,
      max_item_count = 15,
    },
    {
      name = 'nvim_lsp',
      priority = 750,
      max_item_count = 10,
      option = { get_bufnrs = get_bufnrs },
    },
    {
      name = 'buffer',
      priority = 500,
      keywordLength = 3,
      max_item_count = 8,
      option = { get_bufnrs = get_bufnrs },
    },
    {
      name = 'treesitter',
      priority = 300,
      max_item_count = 5,
      option = { get_bufnrs = get_bufnrs },
    },
    {
      name = 'spell',
      priority = 200,
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return not in_mathzone()
        end,
        preselect_correct_word = false,
      },
      keywordLength = 4,
    },
    {
      name = 'path',
      priority = 250
    },
  },
  window = {
    completion = {
      border = "rounded",
    },
    documentation = {
      border = "rounded",
      max_width = 30,
      max_height = 10,
    },
  },
  performance = {
    debounce = 300,
    throttle = 50,
    fetching_timeout = 500,
    confirm_resolve_timeout = 80,
    async_budget = 1,
    max_view_entries = 15,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
        vimtex = "[LaTeX]",
        spell = "[Spell]",
        treesitter = "[TS]",
      })[entry.source.name]
      return vim_item
    end,
  },
  mapping = {
    ['<A-k>'] = cmp.mapping.select_prev_item({ behavior = "insert" }),
    ['<A-j>'] = cmp.mapping.select_next_item({ behavior = "insert" }),
    ['<A-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ['<A-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ['<A-Space>'] = cmp.mapping({
      i = function()
        if cmp.visible() then
          cmp.abort()
        else
          cmp.complete()
        end
      end,
      c = function()
        if cmp.visible() then
          cmp.close()
        else
          cmp.complete()
        end
      end,
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- Always prioritize LuaSnip jumps in math mode
      if in_mathzone() and luasnip.locally_jumpable(1) then
        luasnip.jump(1)
        -- In normal text, check completion first, then LuaSnip
      elseif cmp.visible() and not in_mathzone() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      -- Always prioritize LuaSnip jumps in math mode
      if in_mathzone() and luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
        -- In normal text, check completion first, then LuaSnip
      elseif cmp.visible() and not in_mathzone() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.locally_jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.locally_jumpable(1) then
    --     luasnip.jump(1)
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}

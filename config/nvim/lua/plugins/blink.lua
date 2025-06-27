local function in_mathzone()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

require('blink.cmp').setup({
  keymap = {
    preset = 'none',
    ['<A-k>'] = { 'select_prev', 'fallback' },
    ['<A-j>'] = { 'select_next', 'fallback' },
    ['<A-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<A-f>'] = { 'scroll_documentation_down', 'fallback' },
    ['<A-Space>'] = { 'show', 'hide', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' },
    ['<Tab>'] = {
      function()
        local luasnip = require('luasnip')
        local blink = require('blink.cmp')
        if in_mathzone() and luasnip.locally_jumpable(1) then
          blink.snippet_forward()
        elseif blink.is_visible() and not in_mathzone() then
          blink.select_next()
        elseif luasnip.locally_jumpable(1) then
          blink.snippet_forward()
        else
        end
        return 'fallback'
      end
    },

    ['<S-Tab>'] = {
      function()
        local luasnip = require('luasnip')
        local blink = require('blink.cmp')
        if in_mathzone() and luasnip.locally_jumpable(1) then
          blink.snippet_backward()
        elseif blink.is_visible() and not in_mathzone() then
          blink.select_prev()
        elseif luasnip.locally_jumpable(-1) then
          blink.snippet_backward()
        end
        return 'fallback'
      end,
    },
  },
  snippets = { preset = 'luasnip' },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'spell', 'vimtex' },
    providers = {
      lsp = {
        name = 'LSP',
        module = 'blink.cmp.sources.lsp',
        enabled = true,
        score_offset = 750,
        max_items = 10,
      },
      path = {
        name = 'path',
        score_offset = 250,
      },
      snippets = {
        name = 'snippets',
        module = 'blink.cmp.sources.snippets',
        score_offset = 1000,
        max_items = 10,
        opts = {
          use_show_condition = true,
          show_autosnippets = false,
        },
      },
      vimtex = {
        name = 'vimtex',
        module = 'blink.compat.source',
        score_offset = 900,
      },
      buffer = {
        name = 'buffer',
        score_offset = 500,
        max_items = 8,
        min_keyword_length = 4,
      },
      -- spell = {
      --   name = 'spell',
      --   module = 'blink.compat.source',
      --   score_offset = 200,
      --   max_items = 5,
      -- },
      spell = {
        name = 'Spell',
        module = 'blink-cmp-spell',
      },
    },
  },
  -- Completion configuration
  completion = {
    list = {
      selection = { preselect = false, auto_insert = true }
    },
    ghost_text = {
      enabled = false,
    },
    menu = {
      draw = {
        gap = 1,
        columns = {
          { "label",     "label_description" },
          { "kind_icon", gap = 1,            "source_id" } },
        treesitter = { 'lsp' },
        components = {
          label = {
            width = { fill = true, max = 60 },
          },
          kind = {
            width = { fill = true, max = 30 },
          },
          source_id = {
            width = { max = 50 },
            text = function(ctx) return ctx.source_name end,
            highlight = 'BlinkCmpSource',
          },
        }
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
      treesitter_highlighting = true,
    },
  },
})

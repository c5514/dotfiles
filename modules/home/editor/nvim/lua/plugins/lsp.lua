-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = require('blink.cmp').get_lsp_capabilities({
  textDocument = { completion = { completionItem = { snippetSupport = false } } },
})
vim.lsp.config('pyright', {
  capabilities = capabilities,
})
vim.lsp.config('texlab', {
  capabilities = capabilities,
})
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          'require'
        },
      },
    },
  },
})

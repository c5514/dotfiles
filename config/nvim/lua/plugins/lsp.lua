-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = require('blink.cmp').get_lsp_capabilities({
  textDocument = { completion = { completionItem = { snippetSupport = false } } },
})
require("lspconfig").pyright.setup {
  capabilities = capabilities,
}
require("lspconfig").texlab.setup {
  capabilities = capabilities,
}
require("lspconfig").lua_ls.setup {
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
}

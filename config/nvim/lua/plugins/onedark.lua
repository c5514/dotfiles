require('onedark').setup {
  style = 'warmer',
  -- transparent = true,
  term_colors = true,
  ending_tildes = false,
  cmp_itemkind_reverse = false,
  toggle_style_key = "<leader>ts",
  toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between
  -- Options are italic, bold, underline, none
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
  lualine = {
    transparent = false,
  },
  colors = {
    bg0 = "#0d1117",
  },
  highlights = {},
  diagnostics = {
    darker = true,     -- darker colors for diagnostic
    undercurl = true,  -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
}
require('onedark').load()

vim.api.nvim_set_hl(0,"MiniClueDescSingle", {bg="#1e1e1e"})
vim.api.nvim_set_hl(0,"MiniClueDescGroup", {bg="#1e1e1e", fg="#c678dd"})
vim.api.nvim_set_hl(0,"MiniClueNextKey", {bg="#1e1e1e", fg="#57a5e5"})
vim.api.nvim_set_hl(0,"MiniClueNextKeyWithPostkeys", {bg="#1e1e1e", fg="#818387"})
vim.api.nvim_set_hl(0,"MiniClueSeparator", {bg="#1e1e1e", fg="#c678dd"})
vim.api.nvim_set_hl(0,"MiniClueBorder", {bg="#1e1e1e", fg="#c678dd"})

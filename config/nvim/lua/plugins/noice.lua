require("noice").setup({
  lsp = {
    messages = {
      enabled = false,
    },
    progress = {
      enabled = true,
      view = "mini",
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  popupmenu = {
    enabled = true,
    backend = "nui",
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
  -- cmdline = {
  --   view = "cmdline",
  -- },
})

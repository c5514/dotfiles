require("mini.surround").setup({
  mappings = {
    add = "gsa",
    delete = "gsd",
    find = "gsf",
    find_left = "gsF",
    highlight = "gsh",
    replace = "gsr",
    update_n_lines = "gsn",
  },
})
require("mini.notify").setup(
  {
    content = {
      format = nil,
      sort = nil,
    },
    lsp_progress = {
      enable = true,
      level = 'INFO',
      duration_last = 1000,
    },
    window = {
      config = {},
      max_width_share = 0.382,
      winblend = 25,
    },
  }
)
require("mini.comment").setup()
require("mini.indentscope").setup()
require("mini.cursorword").setup()
require("mini.align").setup()
require("mini.bracketed").setup()
require("mini.clue").setup({
  window = {
    delay = 100,
    config = {
      border = "none",
      row = "auto",
      col = "auto",
      anchor = "NE",
    },
  },
  triggers = {
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<leader>' },
    { mode = 'i', keys = '<C-x>' },
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },
    { mode = 'n', keys = ']' },
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },
})
require("mini.hipatterns").setup()
require("mini.icons").setup()

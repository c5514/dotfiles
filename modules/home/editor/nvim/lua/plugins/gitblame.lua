require("gitblame").setup {
  enabled                     = true,
  message_template            = "<summary> • <date> • <author>",
  highlight_group             = "Comment",
  delay                       = 200,
  date_format                 = "%r",
  display_virtual_text        = true,
  message_when_not_committed  = "Oh please, commit this !",
  set_extmark_options         = {
    priority = 7,
  },
  use_blame_commite_file_urls = false,
  virtual_text_column         = 80,
}
local map = vim.keymap.set
map("n", "<leader>gb", "gitblame", { desc = "gitblame", silent = true })
map("n", "<leader>gbt", "<cmd>GitBlameToggle<cr>", { desc = "Toggle", silent = true })
map("n", "<leader>gbs", "<cmd>GitBlameCopySHA<cr>", { desc = "Copy SHA", silent = true })
map("n", "<leader>gbc", "<cmd>GitBlameCopyFileURL<cr>", { desc = "Copy URL", silent = true })
map("n", "<leader>gbo", "<cmd>GitBlameOpenFileURL<cr>", { desc = "Open file URL", silent = true })

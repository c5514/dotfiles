vim.g.undotree_DiffAutoOpen = 1
vim.g.undotree_SetFocusWhenToggle = 1

-- Keymap
local map = vim.keymap.set
map("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", { silent = true, desc = "Undotree" })

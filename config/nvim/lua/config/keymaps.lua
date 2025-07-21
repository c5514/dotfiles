local options = { noremap = true, silent = true }
local map = vim.keymap.set
-- Basics
map("n", ";", ":")
map("i", "jk", "<Esc>", options)
map("n", "<leader>/", "<Cmd>nohl<CR>", { desc = "Clear search" })
-- Files
map("n", "<leader>e", "<Cmd>Neotree toggle<CR>", { desc = "Neotree" })
-- Telescope
map("n", "<leader>f", "+find/file", { desc = "+find/file" })
map("n", "<leader>ft", "<Cmd>TodoTelescope<CR>", { desc = "Find TODOs" })
map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fr", "<Cmd>Telescope live_grep<CR>", { desc = "Find text" })
map("n", "<leader>fg", "<Cmd>Telescope oldfiles<CR>", { desc = "Recent" })
map("n", "<leader>fc", "<Cmd>Telescope grep_string<CR>", { desc = "Find string under cursor" })
-- Buffers
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Move to next buffer" })
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Move to previous buffer" })
map("n", "<leader>b", "buffers", { desc = "+buffer" })
map("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete buffers to the right" })
map("n", "<leader>bb", "<Cmd>e #<CR>", { desc = "Switch to other buffer" })
-- Windows
map("n", "<leader>w", "window", { desc = "+windows" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<C-h>", "<C-W>h", { desc = "Move to window left" })
map("n", "<C-l>", "<C-W>l", { desc = "Move to window right" })
map("n", "<C-k>", "<C-W>k", { desc = "Move to window over" })
map("n", "<C-j>", "<C-W>j", { desc = "Move to window below" })
-- Motions
map("n", "<C-d>", "<C-d>zz", { desc = "Allow C-d to keep cursor in the middle" })
map("n", "<C-u>", "<C-u>zz", { desc = "Allow C-u to keep cursor in the middle" })
map("n", "n", "nzzzv", { desc = "Allow search terms to stay in the middle" })
map("n", "N", "Nzzzv", { desc = "Allow search terms to stay in the middle" })
-- Yazi
map("n", "<leader>y", "+yazi", { desc = "+yazi" })
map("n", "<leader>yy", "<cmd>Yazi<cr>", { desc = "Yazi at the current file" })
map("n", "<leader>yw", "<cmd>Yazi cwd<cr>", { desc = "Yazi at working directory" })
map("n", "<leader>yr", "<cmd>Yazi toggle<cr>", { desc = "Resume Yazi session" })
-- LaTex
map("n", "<leader>l", "+latex", { desc = "+LaTeX" })
-- Inkscape
map("n", "<leader>i", "+inkscape", { desc = "+inkscape" })
-- Formatting
map("n", "<leader>c", "+formatting", { desc = "+formatting" })
map('n', '<leader>cp', function()
  local start_pos = vim.fn.search('^\\s*$', 'bnW') + 1
  local end_pos = vim.fn.search('^\\s*$', 'nW') - 1
  if start_pos <= 0 then start_pos = 1 end
  if end_pos <= 0 then end_pos = vim.api.nvim_buf_line_count(0) end
  require('conform').format({
    range = { start = { start_pos, 0 }, ['end'] = { end_pos, 0 } },
    timeout_ms = 500,
  })
end, { desc = 'Format paragraph' })
-- Git
map("n", "<leader>g", "+git", { desc = "+git" })



-- Vimtex comands reassigned
-- Change of math mode ds$ --> dsm, cs$ --> csm, ts$ --> tsm
map("n", "dsm", "<Plug>(vimtex-env-delete-math)", { noremap = false, silent = true })
map("n", "csm", "<Plug>(vimtex-env-change-math)", { noremap = false, silent = true })
map("n", "tsm", "<Plug>(vimtex-env-toggle-math)", { noremap = false, silent = true })
-- Change of environment ]m --> ]e, ]M --> ]E, [m-->[e, [M --> [E
map({ "n", "x", "o" }, "]e", "<Plug>(vimtex-]m)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "]E", "<Plug>(vimtex-]M)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "[e", "<Plug>(vimtex-[m)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "[E", "<Plug>(vimtex-[M)", { noremap = false, silent = true })
-- Change of math mode ]n --> ]m, ]N --> ]M, [n-->[m, [N --> [M
map({ "n", "x", "o" }, "]m", "<Plug>(vimtex-]n)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "]M", "<Plug>(vimtex-]N)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "[m", "<Plug>(vimtex-[n)", { noremap = false, silent = true })
map({ "n", "x", "o" }, "[M", "<Plug>(vimtex-[N)", { noremap = false, silent = true })
-- Change of itemize/enumerate environment am --> ai, im --> ii
map({ "x", "o" }, "ai", "<Plug>(vimtex-am)", { noremap = false, silent = true })
map({ "x", "o" }, "ii", "<Plug>(vimtex-im)", { noremap = false, silent = true })
-- Change of math mode a$ --> am, i$ --> im
map({ "x", "o" }, "am", "<Plug>(vimtex-a$)", { noremap = false, silent = true })
map({ "x", "o" }, "im", "<Plug>(vimtex-i$)", { noremap = false, silent = true })

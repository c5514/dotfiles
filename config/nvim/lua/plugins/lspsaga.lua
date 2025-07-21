-- LSPSaga setup
require('lspsaga').setup({
  beacon = {
    enable = true,
  },
  ui = {
    border = "rounded", -- One of none, single, double, rounded, solid, shadow
    code_action = "", -- Can be any symbol you want 💡
  },
  hover = {
    open_cmd = "!firefox", -- Choose your browser
    open_link = "gx",
  },
  diagnostic = {
    border_follow = true,
    diagnostic_only_current = false,
    show_code_action = true,
  },
  symbol_in_winbar = {
    enable = true, -- Breadcrumbs
  },
  code_action = {
    extend_gitsigns = false,
    show_server_name = true,
    only_in_cursor = true,
    num_shortcut = true,
    keys = {
      exec = "<CR>",
      quit = { "<Esc>", "q" },
    },
  },
  lightbulb = {
    enable = false,
    sign = false,
    virtual_text = true,
  },
  implement = {
    enable = false,
  },
  rename = {
    auto_save = false,
    keys = {
      exec = "<CR>",
      quit = { "<C-k>", "<Esc>" },
      select = "x",
    },
  },
  outline = {
    auto_close = true,
    auto_preview = true,
    close_after_jump = true,
    layout = "normal",      -- normal or float
    win_position = "right", -- left or right
    keys = {
      jump = "e",
      quit = "q",
      toggle_or_jump = "o",
    },
  },
  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
})

-- Keymaps
local map = vim.keymap.set

map("n", "gd", "<cmd>Lspsaga finder def<CR>", { desc = "Goto Definition", silent = true })
map("n", "gr", "<cmd>Lspsaga finder ref<CR>", { desc = "Goto References", silent = true })
-- map("n", "gD", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Goto Declaration", silent = true })
map("n", "gI", "<cmd>Lspsaga finder imp<CR>", { desc = "Goto Implementation", silent = true })
map("n", "gT", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Type Definition", silent = true })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover", silent = true })
map("n", "<leader>cw", "<cmd>Lspsaga outline<CR>", { desc = "Outline", silent = true })
map("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", { desc = "Rename", silent = true })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action", silent = true })
map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics", silent = true })
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic", silent = true })
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Previous Diagnostic", silent = true })

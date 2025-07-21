-- Ensure you have alpha.nvim installed first, e.g., via packer.nvim:
-- use { 'goolord/alpha-nvim' }

-- Import alpha.nvim
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Define the layout for alpha (dashboard)
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
  "                                                     ",
}

-- Define the buttons (with actions)
dashboard.section.buttons.val = {
  dashboard.button("f", "󰱼  Find File", ":Telescope find_files <CR>"),
  dashboard.button("g", "󰊄  Find Word", ":Telescope live_grep <CR>"),
  dashboard.button("r", "󱋡  Recent Files", ":Telescope oldfiles <CR>"),
  dashboard.button("K", "  Keymaps", ":Telescope keymaps<CR>"),
  dashboard.button("c", "  Config", ":Telescope find_files cwd=~/.config/nvim <CR>"),
  dashboard.button("L", "󰒲  Lazy", ":Lazy <CR>"),
  dashboard.button("q", "󰈆  Quit", ":qa <CR>"),
}

-- Optional: Padding for formatting the layout
-- dashboard.section.footer.val = "Welcome to Neovim!"

-- Set the alpha dashboard as the start screen
alpha.setup(dashboard.opts)

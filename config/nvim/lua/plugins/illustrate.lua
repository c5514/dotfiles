local illustrate = require('illustrate')
local illustrate_finder = require('illustrate.finder')

vim.keymap.set('n', '<leader>is', function()
  local filename = vim.fn.input("[SVG] Filename: ")

  if filename and filename ~= "" then
    illustrate.create_and_open_svg(filename)

    vim.defer_fn(function()
      local pathFile = "figures/" .. filename .. ".svg"
      vim.fn.system("chmod +w " .. pathFile)
    end, 100)
  else
    print("Filename cannot be empty.")
  end
end, { desc = "Create and open a new SVG file with provided name and set write permissions" })

local map = vim.keymap.set
map('n', '<leader>ia', function() illustrate.create_and_open_ai() end,
  { desc = "Create and open a new Adobe Illustrator file with provided name" })
map('n', '<leader>io', function() illustrate.open_under_cursor() end,
  { desc = "Open file under cursor or file within environment under cursor" })
map('n', '<leader>if', function() illustrate_finder.search_and_open() end,
  { desc = "Search and open illustrations in default app" })
map('n', '<leader>ic', function() illustrate_finder.search_create_copy_and_open() end,
  { desc = "Search existing file, copy it with a new name and open it in default app" })

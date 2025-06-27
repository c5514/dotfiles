vim.g.mapleader = " "
vim.g.maplocaleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.showtabline = 0
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.termguicolors = true
vim.o.mouse = "a"
vim.o.smartindent = true
vim.o.cursorline = true
vim.o.swapfile = false
vim.o.undofile = true
vim.o.timeoutlen = 200
vim.o.updatetime = 50
vim.o.conceallevel = 2
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 8
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.showmode = false
vim.o.cmdheight = 0
vim.o.wrap = true
-- LaTeX Template System
local function get_latex_templates()
	local templates = {}
	local template_dir = vim.fn.expand("~/Templates/latex")

	-- Check if the directory exists
	if vim.fn.isdirectory(template_dir) == 0 then
		vim.notify("Templates directory not found: " .. template_dir, vim.log.levels.WARN)
		return {}
	end

	-- Get all subdirectories
	local items = vim.fn.glob(template_dir .. "/*", false, true)
	for _, item in ipairs(items) do
		if vim.fn.isdirectory(item) == 1 then
			local name = vim.fn.fnamemodify(item, ":t")
			table.insert(templates, { name = name, path = item })
		end
	end

	return templates
end

local function create_latex_project()
	local latex_templates = get_latex_templates()

	if #latex_templates == 0 then
		vim.notify("No LaTeX templates found in ~/Templates/latex", vim.log.levels.WARN)
		return
	end

	-- Check if telescope is available
	local ok, telescope = pcall(require, "telescope.pickers")
	if not ok then
		vim.notify("Telescope not found", vim.log.levels.ERROR)
		return
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Select LaTeX Template",
			finder = require("telescope.finders").new_table({
				results = latex_templates,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.name,
						ordinal = entry.name,
					}
				end,
			}),
			sorter = require("telescope.config").values.generic_sorter({}),
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					require("telescope.actions").close(prompt_bufnr)

					local project_name = vim.fn.input("Project name: ")
					if project_name == "" then
						return
					end

					local project_path = vim.fn.getcwd() .. "/" .. project_name
					local template_path = vim.fn.expand(selection.value.path)

					-- Copy the entire template folder and rename it to project name
					os.execute(
						string.format("cp -r %s %s && chmod -R u+w %s", template_path, project_path, project_path)
					)

					vim.cmd("edit " .. project_path .. "/main.tex")
					vim.cmd("cd " .. project_path)
				end)
				return true
			end,
		})
		:find()
end

-- Register command
vim.api.nvim_create_user_command("LaTeXNew", create_latex_project, {})

-- Keymap
local map = vim.keymap.set
map("n", "<leader>ln", ":LaTeXNew<CR>", { desc = "New LaTeX project" })

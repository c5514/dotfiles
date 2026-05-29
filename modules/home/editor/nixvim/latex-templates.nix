{ lib, config, ... }:
{
  programs.nixvim.extraConfigLua = lib.mkIf config.programs.nixvim.plugins.telescope.enable ''
    -- LaTeX Template System
    local function get_latex_templates()
      local templates = {}
      local template_dir = vim.fn.expand("~/Templates/latex")

      if vim.fn.isdirectory(template_dir) == 0 then
        vim.notify("Templates directory not found: " .. template_dir, vim.log.levels.WARN)
        return {}
      end

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

    vim.api.nvim_create_user_command("LaTeXNew", create_latex_project, {})
    vim.keymap.set("n", "<leader>ln", ":LaTeXNew<CR>", { desc = "New LaTeX project" })
  '';
}

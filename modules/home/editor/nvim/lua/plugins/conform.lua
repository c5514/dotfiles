require("conform").setup({
	format_on_save = function(bufnr)
		local ft = vim.bo[bufnr].filetype
		if ft == "tex" or ft == "bib" then
			return nil
		end
		return {
			timeout_ms = 5000,
			lsp_fallback = true,
		}
	end,
	notify_on_error = true,
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		nix = { "nixfmt" },
		markdown = { "prettierd", "prettier" },
		tex = { "latexindent" },
		bib = { "latexindent" },
	},
})

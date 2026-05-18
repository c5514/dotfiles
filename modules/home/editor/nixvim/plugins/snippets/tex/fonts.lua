local ls = require("luasnip")
local U = dofile(vim.fn.expand("~/snippets/tex/_utils.lua"))
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node

ls.add_snippets("tex", {
	U.n({
		trig = "it",
		dscr = "Italic text/math",
		nodes = {
			f(function()
				if U.in_mathzone() then
					return "\\mathit{"
				else
					return "\\textit{"
				end
			end, {}),
			i(1, ""),
			t("}"),
		},
	}),
	U.n({
		trig = "bf",
		dscr = "Bold text/math",
		nodes = {
			f(function()
				if U.in_mathzone() then
					return "\\mathbf{"
				else
					return "\\textbf{"
				end
			end, {}),
			i(1, ""),
			t("}"),
		},
	}),
})

ls.add_snippets(
	"tex",
	U.batch_postfix({
		{ trig = "cal", cmd = "\\mathcal" },
		{ trig = "frak", cmd = "\\mathfrak" },
		{ trig = "rm", cmd = "\\mathrm" },
		{ trig = "bb", cmd = "\\mathbb" },
		{ trig = "sf", cmd = "\\mathsf" },
	})
)

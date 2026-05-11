local ls = require("luasnip")
local U = dofile(vim.fn.expand("~/snippets/tex/_utils.lua"))
local i = ls.insert_node
local t = ls.text_node

local snippets = {}

local brackets = {
	{ trig = "lr(", left = "(", right = ")" },
	{ trig = "lr|", left = "|", right = "|" },
	{ trig = "lr{", left = "\\{", right = "\\}" },
	{ trig = "lr[", left = "[", right = "]" },
	{ trig = "lr<", left = "\\langle", right = "\\rangle" },
	{ trig = "lrB", left = "\\{", right = "\\}" },
}

for _, br in ipairs(brackets) do
	table.insert(
		snippets,
		U.fmta({
			trig = br.trig,
			snippetType = "autosnippet",
			template = string.format("\\left%s<>\\right%s", br.left, br.right),
			nodes = { i(1, " ") },
		})
	)
end

table.insert(
	snippets,
	U.n({
		trig = "()",
		snippetType = "autosnippet",
		nodes = { t("\\left("), i(1, " "), t("\\right)") },
	})
)

local delimiters = {
	{ trig = "mean", cmd = "\\mean" },
	{ trig = "norm", cmd = "\\norm" },
	{ trig = "abs", cmd = "\\abs" },
	{ trig = "floor", cmd = "\\floor" },
}

for _, d in ipairs(delimiters) do
	table.insert(
		snippets,
		U.fmta({
			trig = d.trig,
			wordTrig = true,
			template = string.format("%s{<>}", d.cmd),
			nodes = { i(1, " ") },
			opts = { dscr = d.cmd:sub(2):gsub("^%l", string.upper) },
		})
	)
end

local qm = {
	{ trig = "bra", template = [[\bra{<>}]], nodes = { i(1, " ") } },
	{ trig = "ket", template = [[\ket{<>}]], nodes = { i(1, " ") } },
	{ trig = "bk", template = [[\braket{<>}{<>}]], nodes = { i(1, " "), i(2, " ") } },
	{ trig = "obk", template = [[\bra{<>}<>\ket{<>}]], nodes = { i(1, " "), i(2, " "), i(3, " ") } },
	{ trig = "kb", template = [[\ketbra{<>}{<>}]], nodes = { i(1, " "), i(2, " ") } },
}

for _, q in ipairs(qm) do
	table.insert(
		snippets,
		U.fmta({
			trig = q.trig,
			wordTrig = true,
			snippetType = "autosnippet",
			template = q.template,
			nodes = q.nodes,
			opts = { dscr = q.trig:sub(1, 1):upper() .. q.trig:sub(2) .. " notation" },
		})
	)
end

ls.add_snippets("tex", snippets)

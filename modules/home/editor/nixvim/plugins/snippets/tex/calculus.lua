local ls = require("luasnip")
local U = dofile(vim.fn.expand("~/snippets/tex/_utils.lua"))
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node

local snippets = {}

table.insert(
	snippets,
	U.c({
		trig = "lim",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Limits",
		choices = {
			fmta([[\lim_{<> \to <>}]], { i(1, "n"), i(2, "\\infty") }),
			fmta([[\limsup_{<>\to <>}]], { i(1, "n"), i(2, "\\infty") }),
			fmta([[\liminf_{<>\to <>}]], { i(1, "n"), i(2, "\\infty") }),
		},
	})
)

table.insert(
	snippets,
	U.c({
		trig = "sum",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Summation",
		choices = {
			fmta([[\sum_{<>}]], { i(1, "i") }),
			fmta([[\sum_{<>}^{<>}]], { i(1, "n=0"), i(2, "\\infty") }),
			fmta([[\sum_{<>\in <>}]], { i(1, "i"), i(2, "I") }),
		},
	})
)

table.insert(
	snippets,
	U.c({
		trig = "pro",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Product",
		choices = {
			fmta([[\prod_{<>}^{<>}]], { i(1, "n=0"), i(2, "\\infty") }),
			fmta([[\prod_{<>\in <>}]], { i(1, "i"), i(2, "I") }),
		},
	})
)

table.insert(
	snippets,
	U.c({
		trig = "cup",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Union",
		choices = {
			fmta([[\bigcup_{<>=0}^{<>}<>_{<>}]], { i(1), i(2, "\\infty"), i(3, "A"), rep(1) }),
			fmta([[\bigcup_{<>\in <>}<>_{<>}]], { i(1), i(2), i(3, "A"), rep(1) }),
		},
	})
)

table.insert(
	snippets,
	U.c({
		trig = "cap",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Intersection",
		choices = {
			fmta([[\bigcap_{<>=0}^{<>}<>_{<>}]], { i(1), i(2, "\\infty"), i(3, "A"), rep(1) }),
			fmta([[\bigcap_{<>\in <>}<>_{<>}]], { i(1), i(2), i(3, "A"), rep(1) }),
		},
	})
)

table.insert(
	snippets,
	ls.snippet(
		{
			trig = "(%d)dev",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			dscr = "Nth derivative (1dev, 2dev, etc.)",
		},
		fmta([[\frac{\dd^{<>} <>}{\dd <>^{<>}}]], {
			f(function(_, snip)
				local n = tonumber(snip.captures[1])
				return n == 1 and "" or tostring(n)
			end),
			i(1),
			i(2, "x"),
			f(function(_, snip)
				local n = tonumber(snip.captures[1])
				return n == 1 and "" or tostring(n)
			end),
		}),
		{ condition = U.in_mathzone }
	)
)

table.insert(
	snippets,
	ls.snippet(
		{
			trig = "(%d)pde",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			dscr = "Nth partial derivative (1pde, 2pde, etc.)",
		},
		fmta([[\frac{\partial^{<>} <>}{\partial <>^{<>}}]], {
			f(function(_, snip)
				local n = tonumber(snip.captures[1])
				return n == 1 and "" or tostring(n)
			end),
			i(1),
			i(2, "x"),
			f(function(_, snip)
				local n = tonumber(snip.captures[1])
				return n == 1 and "" or tostring(n)
			end),
		}),
		{ condition = U.in_mathzone }
	)
)

table.insert(
	snippets,
	U.c({
		trig = "pdd",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Mixed partial derivative",
		choices = {
			fmta([[\frac{\partial^2 <>}{\partial <> \partial <>}]], { i(1), i(2, "x"), i(3, "y") }),
			fmta(
				[[\frac{\partial^3 <>}{\partial <> \partial <> \partial <>}]],
				{ i(1), i(2, "x"), i(3, "y"), i(4, "z") }
			),
		},
	})
)

table.insert(
	snippets,
	U.c({
		trig = "devc",
		wordTrig = true,
		dscr = "Derivative (choice menu)",
		choices = {
			fmta([[\frac{\dd <>}{\dd <>}]], { i(1), i(2, "x") }),
			fmta([[\frac{\dd^2 <>}{\dd <>^2}]], { i(1), i(2, "x") }),
			fmta([[\frac{\dd^3 <>}{\dd <>^3}]], { i(1), i(2, "x") }),
		},
	})
)
table.insert(
	snippets,
	U.c({
		trig = "pdec",
		wordTrig = true,
		dscr = "Partial Derivative (choice menu)",
		choices = {
			fmta([[\frac{\partial <>}{\partial <>}]], { i(1), i(2, "x") }),
			fmta([[\frac{\partial^2 <>}{\partial <>^2}]], { i(1), i(2, "x") }),
			fmta([[\frac{\partial^3 <>}{\partial <>^3}]], { i(1), i(2, "x") }),
		},
	})
)

table.insert(
	snippets,
	U.c({
		trig = "dd",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Differential forms",
		choices = {
			fmta([[\dd <>]], { i(1, "x") }),
			fmta([[\dd <> \wedge \dd <>]], { i(1, "x"), i(2, "y") }),
			fmta([[\dd <> \wedge \dd <> \wedge \dd <>]], { i(1, "x"), i(2, "y"), i(3, "z") }),
			fmta([[\dd <>_1 \wedge \dd <>_2 \wedge \dots \wedge \dd <>_<>]], {
				i(1, "x"),
				rep(1),
				rep(1),
				i(2, "k"),
			}),
		},
	})
)

table.insert(
	snippets,
	U.c({
		trig = "int",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Indefinite integral",
		choices = {
			fmta([[\int <> \dd <>]], { i(1), i(2, "x") }),
			fmta([[\iint <> \dd <>]], { i(1), i(2, "x") }),
			fmta([[\iiint <> \dd <>]], { i(1), i(2, "x") }),
		},
	})
)

table.insert(
	snippets,
	U.fmta({
		trig = "dint",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Definite integral",
		template = [[\int_{<>}^{<>}<> \dd <>]],
		nodes = { i(1, "0"), i(2, "\\infty"), i(3, "content"), i(4, "x") },
	})
)

table.insert(
	snippets,
	U.c({
		trig = "ont",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Contour integral",
		choices = {
			fmta([[\oint <> \dd <>]], { i(1), i(2, "x") }),
			fmta([[\oiint <> \dd <>]], { i(1), i(2, "x") }),
		},
	})
)

table.insert(
	snippets,
	U.c({
		trig = "ff",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Fraction",
		choices = {
			fmta([[\frac{<>}{<>}]], { i(1), i(2) }),
			fmta([[\left(\frac{<>}{<>}\right)]], { i(1), i(2) }),
		},
	})
)

table.insert(
	snippets,
	U.c({
		trig = "ee",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Exponential",
		choices = {
			fmta([[e^{<>}]], { i(1) }),
			fmta([[e^{\left(\frac{<>}{<>}\right)}]], { i(1), i(2) }),
		},
	})
)

table.insert(
	snippets,
	U.c({
		trig = "fun",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Function definition",
		choices = {
			fmta([[<> \colon <> \to <>]], { i(1, "f"), i(2, "\\mathbb{R}"), i(3, "\\mathbb{R}") }),
			fmta(
				[[
<> = \begin{cases}
  <> & \text{if } <>,\\
  <> & \text{if } <>
\end{cases}]],
				{ i(1, "f(x)"), i(2), i(3), i(4), i(5) }
			),
		},
	})
)

table.insert(
	snippets,
	U.c({
		trig = "tup",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Tuple",
		choices = {
			fmta([[(<>,<>)]], { i(1, "x"), i(2, "y") }),
			fmta([[(<>,<>,<>)]], { i(1, "x"), i(2, "y"), i(3, "z") }),
			fmta([[(<>_1, <>_2, \dots, <>_<>)]], { i(1, "x"), rep(1), rep(1), i(2, "k") }),
		},
	})
)

table.insert(
	snippets,
	U.fmta({
		trig = "seq",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Sequence",
		template = [[(<>_{<>})_{<>\in <>}]],
		nodes = { i(1), i(2), rep(2), i(3) },
	})
)

table.insert(
	snippets,
	U.fmta({
		trig = "fam",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Family of sets",
		template = [[\{<>_{<>}\}_{<>\in <>}]],
		nodes = { i(1), i(2), rep(2), i(3) },
	})
)

table.insert(
	snippets,
	U.c({
		trig = "rep",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Repeated elements",
		choices = {
			fmta([[\underbrace{<> \wedge <> \wedge \dots \wedge <>}_{\text{$<>$ times}}]], {
				i(1, "V"),
				rep(1),
				rep(1),
				i(2, "k"),
			}),
			fmta([[\underbrace{<> \times <> \times \dots \times <>}_{\text{$<>$ times}}]], {
				i(1, "V"),
				rep(1),
				rep(1),
				i(2, "k"),
			}),
			fmta([[\underbrace{<> \otimes <> \otimes \dots \otimes <>}_{\text{$<>$ times}}]], {
				i(1, "V"),
				rep(1),
				rep(1),
				i(2, "k"),
			}),
		},
	})
)

table.insert(
	snippets,
	U.fmta({
		trig = "sq",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Square root",
		template = [[\sqrt{<>}]],
		nodes = { i(1) },
	})
)

table.insert(
	snippets,
	U.fmta({
		trig = "tt",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Text in math mode",
		template = [[\text{<>}]],
		nodes = { i(1) },
	})
)

table.insert(
	snippets,
	U.c({
		trig = "   ",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Horizontal spacing",
		choices = {
			t("\\quad "),
			t("\\qquad "),
		},
	})
)

ls.add_snippets("tex", snippets)

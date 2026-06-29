local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local U = dofile(vim.fn.expand("~/snippets/tex/_utils.lua"))
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local rep = require("luasnip.extras").rep

ls.add_snippets(
	"tex",
	U.batch_autosnippet({
		{ trig = "ooo", text = "\\infty" },
		{ trig = "fall", text = "\\forall" },
		{ trig = "AA", text = "\\forall" },
		{ trig = "exi", text = "\\exists" },
		{ trig = "nex", text = "\\nexists" },
		{ trig = "neg", text = "\\neg" },

		{ trig = "***", text = "\\cdots", opts = { wordTrig = false } },
		{ trig = "...", text = "\\ldots", opts = { wordTrig = false } },
		{ trig = ",.", text = "\\cdot", opts = { wordTrig = false } },

		{ trig = "xx", text = "\\times" },
		{ trig = "oxo", text = "\\otimes" },
		{ trig = "opo", text = "\\oplus" },
		{ trig = "///", text = "\\setminus", opts = { wordTrig = false } },
		{ trig = "divd", text = "\\div" },
		{ trig = "pm", text = "\\pm" },
		{ trig = "mp", text = "\\mp" },
		{ trig = "cdotb", text = "\\bullet" },
		{ trig = "star", text = "\\star" },
		{ trig = "ast", text = "\\ast" },
		{ trig = "circ", text = "\\circ" },

		{ trig = "neq", text = "\\neq" },
		{ trig = "geq", text = "\\geq" },
		{ trig = "leq", text = "\\leq" },
		{ trig = "app", text = "\\approx" },
		{ trig = "cong", text = "\\cong" },
		{ trig = "eqv", text = "\\equiv" },
		{ trig = "prp", text = "\\propto" },
		{ trig = "perp", text = "\\perp" },
		{ trig = "||", text = "\\mid", opts = { wordTrig = false } },
		{ trig = "~~", text = "\\sim", opts = { wordTrig = false } },
		{ trig = "simeq", text = "\\simeq" },
		{ trig = "asy", text = "\\asymp" },
		{ trig = "deq", text = "\\doteq" },

		{ trig = "iin", text = "\\in" },
		{ trig = "nin", text = "\\notin" },
		{ trig = "nn", text = "\\cap" },
		{ trig = "NN", text = "\\bigcap" },
		{ trig = "uu", text = "\\cup" },
		{ trig = "UU", text = "\\bigcup" },
		{ trig = "cc", text = "\\subset" },
		{ trig = "sube", text = "\\subseteq" },
		{ trig = "supe", text = "\\supseteq" },
		{ trig = "sbset", text = "\\subsetneq" },
		{ trig = "empt", text = "\\emptyset" },
		{ trig = "varn", text = "\\varnothing" },

		{ trig = "vv", text = "\\vee" },
		{ trig = "ww", text = "\\wedge" },
		{ trig = "iff", text = "\\iff" },

		{ trig = "<<", text = "\\ll", opts = { wordTrig = false } },
		{ trig = ">>", text = "\\gg", opts = { wordTrig = false } },

		{ trig = "cua", text = "\\square" },
		{ trig = "tri", text = "\\triangle" },

		{ trig = "pap", text = "\\partial" },
		{ trig = "nbl", text = "\\nabla" },
		{ trig = "ell", text = "\\ell" },
		{ trig = "wp", text = "\\wp" },
		{ trig = "aleph", text = "\\aleph" },

		{ trig = "angl", text = "\\angle" },
		{ trig = "mngl", text = "\\measuredangle" },
		{ trig = "pll", text = "\\parallel" },
		{ trig = "npl", text = "\\nparallel" },

		{ trig = "pri", text = "\\prime" },
		{ trig = "ppr", text = "^{\\prime}" },
		{ trig = "ppp", text = "^{\\prime\\prime}" },
	})
)

ls.add_snippets("tex", {
	U.c({
		trig = "to",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Arrows",
		choices = { t("\\to"), t("\\mapsto"), t("\\longmapsto") },
	}),

	U.c({
		trig = "rra",
		snippetType = "autosnippet",
		dscr = "Right arrows",
		choices = { t("\\rightarrow"), t("\\longrightarrow"), t("\\Longrightarrow") },
	}),

	U.c({
		trig = "lla",
		snippetType = "autosnippet",
		dscr = "Left arrows",
		choices = { t("\\leftarrow"), t("\\longleftarrow"), t("\\Longleftarrow") },
	}),

	U.c({
		trig = "bba",
		snippetType = "autosnippet",
		dscr = "Bidirectional arrows",
		choices = { t("\\leftrightarrow"), t("\\longleftrightarrow"), t("\\Longleftrightarrow") },
	}),

	U.s({ trig = "thn", snippetType = "autosnippet", dscr = "Implies", text = "\\Longrightarrow" }),

	U.c({
		trig = "->",
		snippetType = "autosnippet",
		wordTrig = false,
		dscr = "Arrow shortcuts",
		choices = { t("\\rightarrow"), t("\\leftarrow"), t("\\leftrightarrow") },
	}),

	U.c({
		trig = "=>",
		snippetType = "autosnippet",
		wordTrig = false,
		dscr = "Double arrow shortcuts",
		choices = { t("\\Rightarrow"), t("\\Leftarrow"), t("\\Leftrightarrow") },
	}),

	U.c({
		trig = "-->",
		snippetType = "autosnippet",
		opts = { priority = 50 },
		dscr = "Long arrow shortcuts",
		choices = { t("\\longrightarrow"), t("\\longleftarrow"), t("\\longleftrightarrow") },
	}),

	U.c({
		trig = "==>",
		snippetType = "autosnippet",
		opts = { priority = 50 },
		dscr = "Long double arrow shortcuts",
		choices = { t("\\Longrightarrow"), t("\\Longleftarrow"), t("\\Longleftrightarrow") },
	}),

	U.s({ trig = "surj", wordTrig = true, snippetType = "autosnippet", dscr = "Surjection arrow", text = "\\surjto" }),
	U.s({ trig = "inj", wordTrig = true, snippetType = "autosnippet", dscr = "Injection arrow", text = "\\injto" }),
})

ls.add_snippets("tex", {
	U.s({ trig = "sr", wordTrig = false, snippetType = "autosnippet", dscr = "Square", text = "^2" }),
	U.s({ trig = "cb", wordTrig = false, snippetType = "autosnippet", dscr = "Cube", text = "^3" }),

	U.fmta({
		trig = "td",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Superscript",
		template = [[^{<>}]],
		nodes = { i(1) },
	}),
	U.fmta({
		trig = "sb",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Subscript",
		template = [[_{<>}]],
		nodes = { i(1) },
	}),
	U.fmta({
		trig = "^^",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Superscript",
		template = [[^{<>}]],
		nodes = { i(1) },
	}),
	U.fmta({
		trig = "__",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Subscript",
		template = [[_{<>}]],
		nodes = { i(1) },
	}),
	U.fmta({
		trig = ";;",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Superscript",
		template = [[^<>]],
		nodes = { i(1) },
	}),
	U.fmta({
		trig = ",,",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Subscript",
		template = [[_<>]],
		nodes = { i(1) },
	}),
})

ls.add_snippets(
	"tex",
	U.batch_postfix({
		{ trig = "bar", cmd = "\\bar" },
		{ trig = "hat", cmd = "\\hat" },
		{ trig = "til", cmd = "\\tilde" },
		{ trig = "udl", cmd = "\\underline" },
		{ trig = "ovl", cmd = "\\overline" },
		{ trig = "vec", cmd = "\\vec" },
		{ trig = "vb", cmd = "\\vb" },
		{ trig = "vm", cmd = "\\vb*" },
	})
)

ls.add_snippets("tex", {
	U.fmta({
		trig = "sq",
		snippetType = "autosnippet",
		dscr = "Square root",
		template = [[\sqrt{<>}]],
		nodes = { i(1) },
	}),
})

ls.add_snippets("tex", {
	U.fmta({
		trig = "set",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Set definition",
		template = [[<> = \left\{<> \in <> \mid <>\right\}]],
		nodes = { i(1, "A"), i(2, "x"), i(3, "\\mathbb{R}"), i(4, "\\text{condition}") },
	}),
})

ls.add_snippets(
	"tex",
	U.batch_autosnippet({
		{ trig = "sin", text = "\\sin" },
		{ trig = "cos", text = "\\cos" },
		{ trig = "tan", text = "\\tan" },
		{ trig = "cot", text = "\\cot" },
		{ trig = "sec", text = "\\sec" },
		{ trig = "csc", text = "\\csc" },
		{ trig = "asin", text = "\\arcsin" },
		{ trig = "acos", text = "\\arccos" },
		{ trig = "atan", text = "\\arctan" },
		{ trig = "acot", text = "\\arccot" },
		{ trig = "asec", text = "\\arcsec" },
		{ trig = "acsc", text = "\\arccsc" },
		{ trig = "ln", text = "\\ln" },
	})
)

ls.add_snippets("tex", {
	U.c({
		trig = "dt",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Dot derivatives",
		choices = {
			fmta([[\dot{<>}]], { i(1) }),
			fmta([[\ddot{<>}]], { i(1) }),
			fmta([[\dddot{<>}]], { i(1) }),
		},
	}),
})

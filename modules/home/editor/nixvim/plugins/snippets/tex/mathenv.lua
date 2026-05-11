local ls = require("luasnip")
local U = dofile(vim.fn.expand("~/snippets/tex/_utils.lua"))
local fmta = require("luasnip.extras.fmt").fmta
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets("tex", {
	U.fmta({
		trig = "dm",
		wordTrig = true,
		dscr = "Display math",
		template = [[
\[
  <>
\]
]],
		nodes = { i(1) },
		condition = U.in_text,
	}),

	U.fmta({
		trig = "im",
		wordTrig = true,
		dscr = "Inline math",
		template = [[$<>$]],
		nodes = { i(1) },
		condition = U.in_text,
	}),

	U.fmta({
		trig = "ali",
		dscr = "Align environment",
		template = [[\begin{align}
  <>
\end{align}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "ali*",
		dscr = "Align (unnumbered)",
		template = [[\begin{align*}
  <>
\end{align*}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "fal",
		dscr = "Flalign environment",
		template = [[\begin{flalign}
  <>
\end{flalign}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "fal*",
		dscr = "Flalign (unnumbered)",
		template = [[\begin{flalign*}
  <>
\end{flalign*}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "eq",
		dscr = "Equation environment",
		template = [[\begin{equation}
  <>
\end{equation}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "eq*",
		dscr = "Equation (unnumbered)",
		template = [[\begin{equation*}
  <>
\end{equation*}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.c({
		trig = "ali",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Aligned environment (inner)",
		choices = {
			fmta([[\begin{aligned}[b]\n  <>\n\\end{aligned}]], { i(1) }),
			fmta([[\begin{aligned}[c]\n  <>\n\\end{aligned}]], { i(1) }),
		},
		condition = U.in_mathzone,
	}),

	U.c({
		trig = "mat",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Matrix",
		choices = {
			fmta([[\begin{pmatrix}\n  <>\n\\end{pmatrix}]], { i(1) }),
			fmta([[\begin{bmatrix}\n  <>\n\\end{bmatrix}]], { i(1) }),
			fmta([[\begin{Bmatrix}\n  <>\n\\end{Bmatrix}]], { i(1) }),
			fmta([[\begin{matrix}\n  <>\n\\end{matrix}]], { i(1) }),
		},
		condition = U.in_mathzone,
	}),

	U.fmta({
		trig = "det",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Determinant (vmatrix)",
		template = [[\begin{vmatrix}
  <>
\end{vmatrix}]],
		nodes = { i(1) },
		condition = U.in_mathzone,
	}),

	U.fmta({
		trig = "case",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Cases environment",
		template = [[\begin{cases}
  <>
\end{cases}]],
		nodes = { i(1) },
		condition = U.in_mathzone,
	}),

	U.fmta({
		trig = "gat",
		dscr = "Gather environment",
		template = [[\begin{gather}
  <>
\end{gather}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "gat*",
		dscr = "Gather (unnumbered)",
		template = [[\begin{gather*}
  <>
\end{gather*}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "mul",
		dscr = "Multline environment",
		template = [[\begin{multline}
  <>
\end{multline}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "mul*",
		dscr = "Multline (unnumbered)",
		template = [[\begin{multline*}
  <>
\end{multline*}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "spl",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Split environment",
		template = [[\begin{split}
  <>
\end{split}]],
		nodes = { i(1) },
		condition = U.in_mathzone,
	}),
})

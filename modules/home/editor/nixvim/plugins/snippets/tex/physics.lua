local ls = require("luasnip")
local U = dofile(vim.fn.expand("~/snippets/tex/_utils.lua"))
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node

ls.add_snippets("tex", {

	U.fmta({
		trig = "drc",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Dirac equation",
		template = [[(i\hbar \gamma^\mu \partial_\mu - mc)<>=0]],
		nodes = { i(1, "\\psi(x,t)") },
	}),

	U.c({
		trig = "schr",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Schrödinger equation",
		choices = {
			fmta([[i\hbar \frac{\partial}{\partial t} <> = <> <>]], {
				i(1, "\\psi(t)"),
				i(2, "\\hat{H}"),
				rep(1),
			}),
			fmta(
				[[i\hbar \frac{\partial}{\partial t} <> = \left[- \frac{\hbar^2}{2m}\frac{\partial^2}{\partial x^2} + V(x, t)\right]<>]],
				{
					i(1, "\\psi(x,t)"),
					rep(1),
				}
			),
		},
	}),

	U.fmta({
		trig = "smqty",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Small matrix quantity",
		template = [[\smqty(<>)<><>]],
		nodes = { i(1, "1 & 0\\\\0 & 1"), i(2, ""), i(3, "") },
	}),

	U.fmta({
		trig = "mqty",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Matrix quantity",
		template = [[\mqty(<>)<><>]],
		nodes = { i(1, "1 & 0\\\\0 & 1"), i(2, ""), i(3, "") },
	}),

	U.c({
		trig = "pauli",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Pauli matrices",
		choices = {
			{ t("\\sigma_x = \\smqty("), i(1, "0&1\\\\1&0"), t(")") },
			{ t("\\sigma_y = \\smqty("), i(1, "0&-i\\\\i&0"), t(")") },
			{ t("\\sigma_z = \\smqty("), i(1, "1&0\\\\0&-1"), t(")") },
		},
	}),

	U.fmta({
		trig = "ts",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Tensor",
		template = [[\tensor{<>}{<>}]],
		nodes = { i(1), i(2) },
	}),

	U.fmta({
		trig = "tens",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Tensor product",
		template = [[<>\otimes <>]],
		nodes = { i(1, "A"), i(2, "B") },
	}),

	U.n({
		trig = "comm",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Commutator",
		nodes = { t("["), i(1, "A"), t(", "), i(2, "B"), t("]") },
	}),

	U.n({
		trig = "acomm",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Anticommutator",
		nodes = { t("{"), i(1, "A"), t(", "), i(2, "B"), t("}") },
	}),

	U.fmta({
		trig = "com",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Commutator (physics package)",
		template = [[\comm{<>}{<>}]],
		nodes = { i(1, "\\hat{A}"), i(2, "\\hat{B}") },
	}),

	U.fmta({
		trig = "acm",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Anticommutator (physics package)",
		template = [[\acomm{<>}{<>}]],
		nodes = { i(1, "\\hat{A}"), i(2, "\\hat{B}") },
	}),

	U.n({
		trig = "expval",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Expectation value",
		nodes = { t("\\langle "), i(1, "O"), t(" \\rangle") },
	}),

	U.n({
		trig = "bdag",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Hermitian conjugate (bra dag)",
		nodes = { i(1, "a"), t("^{\\dagger}") },
	}),

	U.n({
		trig = "dag",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Dagger",
		nodes = { t("^{\\dagger}") },
	}),

	U.n({
		trig = "inv",
		wordTrig = false,
		snippetType = "autosnippet",
		dscr = "Inverse",
		nodes = { t("^{-1}") },
	}),

	U.s({
		trig = "hilb",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Hilbert space",
		text = "\\mathcal{H}",
	}),
	U.s({
		trig = "iden",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Identity operator",
		text = "\\mathbb{I}",
	}),

	U.s({
		trig = "uevo",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Time evolution operator",
		text = "\\mathcal{U}(t) = e^{-i\\hat{H}t/\\hbar}",
	}),

	U.fmta({
		trig = "conj",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Complex conjugate",
		template = [[\overline{<>}]],
		nodes = { i(1) },
	}),

	U.n({
		trig = "norm",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Norm",
		nodes = { t("\\norm{"), i(1, " "), t("}") },
	}),

	U.n({
		trig = "mean",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Mean/QM expectation",
		nodes = { t("\\mean{"), i(1, " "), t("}") },
	}),
})

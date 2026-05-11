local ls = require("luasnip")
local U = dofile(vim.fn.expand("~/snippets/tex/_utils.lua"))
local i = ls.insert_node

ls.add_snippets("tex", {
	-- ============================================================
	-- THEOREM (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "thm",
		wordTrig = true,
		dscr = "Theorem",
		template = [[\begin{theorem}[<>]
  <>
\end{theorem}]],
		nodes = { i(1, "Name"), i(2) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "thmb",
		wordTrig = true,
		dscr = "Theorem (boxed)",
		template = [[\begin{Theorem}{<>}{thm:<>}
  <>
\end{Theorem}]],
		nodes = { i(1, "Name"), i(2, "label"), i(3, "Content") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- DEFINITION (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "def",
		wordTrig = true,
		dscr = "Definition",
		template = [[\begin{definition}[<>]
  <>
\end{definition}]],
		nodes = { i(1, "Name"), i(2) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "defb",
		wordTrig = true,
		dscr = "Definition (boxed)",
		template = [[\begin{Definition}{<>}{def:<>}
  <>
\end{Definition}]],
		nodes = { i(1, "Name"), i(2, "label"), i(3, "Content") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- PROOF (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "prf",
		wordTrig = true,
		dscr = "Proof",
		template = [[\begin{proof}
  <>
\end{proof}]],
		nodes = { i(1, "Content") },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "prfb",
		wordTrig = true,
		dscr = "Proof (boxed)",
		template = [[\begin{Proof}{<>}{}
  <>
\end{Proof}]],
		nodes = { i(1, "Name"), i(2, "Content") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- COROLLARY (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "corl",
		wordTrig = true,
		dscr = "Corollary",
		template = [[\begin{corollary}
  <>
\end{corollary}]],
		nodes = { i(1, "Content") },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "corlb",
		wordTrig = true,
		dscr = "Corollary (boxed)",
		template = [[\begin{Corollary}{<>}{cor:<>}
  <>
\end{Corollary}]],
		nodes = { i(1, "Name"), i(2, "label"), i(3, "Content") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- LEMMA (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "lemm",
		wordTrig = true,
		dscr = "Lemma",
		template = [[\begin{lemma}
  <>
\end{lemma}]],
		nodes = { i(1, "Content") },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "lemmb",
		wordTrig = true,
		dscr = "Lemma (boxed)",
		template = [[\begin{Lemma}{<>}{lem:<>}
  <>
\end{Lemma}]],
		nodes = { i(1, "Name"), i(2, "label"), i(3, "Content") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- PROPOSITION (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "prop",
		wordTrig = true,
		dscr = "Proposition",
		template = [[\begin{proposition}
  <>
\end{proposition}]],
		nodes = { i(1, "Content") },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "propb",
		wordTrig = true,
		dscr = "Proposition (boxed)",
		template = [[\begin{Proposition}{<>}{prop:<>}
  <>
\end{Proposition}]],
		nodes = { i(1, "Name"), i(2, "label"), i(3, "Content") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- EXAMPLE (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "exm",
		wordTrig = true,
		dscr = "Example",
		template = [[\begin{Example}{<>}{ex:<>}
  <>
\end{Example}]],
		nodes = { i(1, "Name"), i(2, "label"), i(3, "Content") },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "ex",
		wordTrig = true,
		dscr = "Example (simple)",
		template = [[\begin{example}
  <>
\end{example}]],
		nodes = { i(1, "Content") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- NOTE (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "note",
		wordTrig = true,
		dscr = "Note",
		template = [[\begin{Note}
  <>
\end{Note}]],
		nodes = { i(1, "Content") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- REMARK (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "rem",
		wordTrig = true,
		dscr = "Remark",
		template = [[\begin{remark}
  <>
\end{remark}]],
		nodes = { i(1, "Content") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- CONJECTURE (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "conj",
		wordTrig = true,
		dscr = "Conjecture",
		template = [[\begin{conjecture}
  <>
\end{conjecture}]],
		nodes = { i(1, "Content") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- AXIOM (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "ax",
		wordTrig = true,
		dscr = "Axiom",
		template = [[\begin{axiom}
  <>
\end{axiom}]],
		nodes = { i(1, "Content") },
		condition = U.line_begin,
	}),
})

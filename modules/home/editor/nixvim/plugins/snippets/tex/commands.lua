local ls = require("luasnip")
local U = dofile(vim.fn.expand("~/snippets/tex/_utils.lua"))
local i = ls.insert_node
local t = ls.text_node
local rep = require("luasnip.extras").rep

ls.add_snippets("tex", {
	U.fmta({
		trig = "cl",
		dscr = "Document class",
		template = [[\documentclass[<>]{<>}]],
		nodes = { i(1, "12pt,a4paper"), i(2, "article") },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "pk",
		dscr = "Package import",
		template = [[\usepackage[<>]{<>}]],
		nodes = { i(1, ""), i(2, "package") },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "pks",
		dscr = "Multiple packages",
		template = [[\usepackage{<>}]],
		nodes = { i(1, "amsmath, amssymb, amsthm") },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "lti",
		dscr = "TikZ library",
		template = [[\usetikzlibrary{<>}]],
		nodes = { i(1, "arrows.meta") },
	}),

	U.fmta({
		trig = "ct",
		wordTrig = true,
		dscr = "Citation",
		template = [[\cite{<>}]],
		nodes = { i(1, "key") },
	}),
	U.fmta({
		trig = "ctp",
		wordTrig = true,
		dscr = "Citation with page",
		template = [[\cite[<>]{<>}]],
		nodes = { i(1, "p.~42"), i(2, "key") },
	}),
	U.fmta({
		trig = "rf",
		wordTrig = true,
		dscr = "Reference",
		template = [[\ref{<>}]],
		nodes = { i(1, "label") },
	}),
	U.fmta({
		trig = "erf",
		wordTrig = true,
		dscr = "Equation reference",
		template = [[\eqref{<>}]],
		nodes = { i(1, "label") },
	}),
	U.fmta({
		trig = "vrf",
		wordTrig = true,
		dscr = "Variable reference",
		template = [[\vref{<>}]],
		nodes = { i(1, "label") },
	}),
	U.fmta({
		trig = "cp",
		wordTrig = true,
		dscr = "Cleveref reference",
		template = [[\cref{<>}]],
		nodes = { i(1, "label") },
	}),
	U.fmta({
		trig = "Cp",
		wordTrig = true,
		dscr = "Cleveref (capitalized)",
		template = [[\Cref{<>}]],
		nodes = { i(1, "label") },
	}),

	U.n({
		trig = [=[""]=],
		snippetType = "autosnippet",
		dscr = "Double quotes",
		nodes = { t("``"), i(1), t("''") },
		condition = U.in_text,
	}),

	U.n({
		trig = "''",
		snippetType = "autosnippet",
		dscr = "Single quotes",
		nodes = { t("`"), i(1), t("'") },
		condition = U.in_text,
	}),

	U.fmta({
		trig = "ul",
		wordTrig = true,
		dscr = "Underline",
		template = [[\underline{<>}]],
		nodes = { i(1) },
		condition = U.in_text,
	}),
	U.fmta({
		trig = "ttt",
		wordTrig = true,
		dscr = "Typewriter",
		template = [[\texttt{<>}]],
		nodes = { i(1) },
		condition = U.in_text,
	}),
	U.fmta({
		trig = "ss",
		wordTrig = true,
		dscr = "Sans-serif",
		template = [[\textsf{<>}]],
		nodes = { i(1) },
		condition = U.in_text,
	}),
	U.fmta({
		trig = "sc",
		wordTrig = true,
		dscr = "Small caps",
		template = [[\textsc{<>}]],
		nodes = { i(1) },
		condition = U.in_text,
	}),
	U.fmta({
		trig = "emp",
		wordTrig = true,
		dscr = "Emphasis",
		template = [[\emph{<>}]],
		nodes = { i(1) },
		condition = U.in_text,
	}),

	U.s({ trig = "vfill", wordTrig = true, dscr = "Vertical fill", text = "\\vfill" }),
	U.s({ trig = "hfill", wordTrig = true, dscr = "Horizontal fill", text = "\\hfill" }),
	U.s({ trig = "np", wordTrig = true, dscr = "New paragraph", text = "\\par\\noindent" }),
	U.s({ trig = "nl", wordTrig = true, dscr = "Line break", text = "\\\\" }),
	U.s({ trig = "npg", wordTrig = true, dscr = "New page", text = "\\newpage" }),
	U.s({ trig = "clp", wordTrig = true, dscr = "Clear page", text = "\\clearpage" }),

	U.fmta({
		trig = "vsp",
		wordTrig = true,
		dscr = "Vertical space",
		template = [[\vspace{<>}]],
		nodes = { i(1, "1cm") },
	}),
	U.fmta({
		trig = "hsp",
		wordTrig = true,
		dscr = "Horizontal space",
		template = [[\hspace{<>}]],
		nodes = { i(1, "1cm") },
	}),

	U.fmta({
		trig = "inc",
		wordTrig = true,
		dscr = "Include file",
		template = [[\include{<>}]],
		nodes = { i(1, "chapter") },
	}),
	U.fmta({
		trig = "inp",
		wordTrig = true,
		dscr = "Input file",
		template = [[\input{<>}]],
		nodes = { i(1, "file") },
	}),
	U.fmta({
		trig = "incg",
		wordTrig = true,
		dscr = "Include graphics",
		template = [[\includegraphics[width=<>\linewidth]{<>}]],
		nodes = { i(1, "0.8"), i(2, "filename") },
	}),

	U.s({
		trig = "%##",
		snippetType = "autosnippet",
		dscr = "Section divider",
		text = "% ──────────────────────────────────────────────────────────────────────",
	}),
	U.s({
		trig = "%--",
		snippetType = "autosnippet",
		dscr = "Subsection divider",
		text = "% ──────────────────────────────────",
	}),
	U.s({ trig = "%!!", snippetType = "autosnippet", dscr = "TODO comment", text = "% TODO: " }),
	U.s({ trig = "%??", snippetType = "autosnippet", dscr = "FIXME comment", text = "% FIXME: " }),

	U.fmta({
		trig = "dm",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Display math style",
		template = [[\displaystyle <>]],
		nodes = { i(1) },
		condition = U.in_mathzone,
	}),
	U.fmta({
		trig = "tm",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Text math style",
		template = [[\textstyle <>]],
		nodes = { i(1) },
		condition = U.in_mathzone,
	}),
	U.fmta({
		trig = "scm",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Script math style",
		template = [[\scriptstyle <>]],
		nodes = { i(1) },
		condition = U.in_mathzone,
	}),

	U.fmta({
		trig = "col",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Color in math",
		template = [[\textcolor{<>}{<>}]],
		nodes = { i(1, "red"), i(2, "") },
		condition = U.in_mathzone,
	}),

	U.fmta({
		trig = "rsb",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Resize box",
		template = [[\resizebox{<>\linewidth}{!}{$<>$}]],
		nodes = { i(1, "0.9"), i(2, "") },
		condition = U.in_mathzone,
	}),

	U.fmta({
		trig = "url",
		wordTrig = true,
		dscr = "URL",
		template = [[\url{<>}]],
		nodes = { i(1, "https://") },
	}),
	U.fmta({
		trig = "href",
		wordTrig = true,
		dscr = "Hyperlink",
		template = [[\href{<>}{<>}]],
		nodes = { i(1, "url"), i(2, "text") },
	}),

	U.fmta({
		trig = "fn",
		wordTrig = true,
		dscr = "Footnote",
		template = [[\footnote{<>}]],
		nodes = { i(1, "text") },
	}),
	U.fmta({
		trig = "mgn",
		wordTrig = true,
		dscr = "Margin note",
		template = [[\marginpar{<>}]],
		nodes = { i(1, "text") },
	}),

	U.s({ trig = "hr", wordTrig = true, dscr = "Horizontal rule", text = "\\hrulefill" }),
	U.s({ trig = "tdot", wordTrig = true, dscr = "Table of contents", text = "\\tableofcontents" }),
	U.s({ trig = "lof", wordTrig = true, dscr = "List of figures", text = "\\listoffigures" }),
	U.s({ trig = "lot", wordTrig = true, dscr = "List of tables", text = "\\listoftables" }),
	U.s({ trig = "mak", wordTrig = true, dscr = "Make title", text = "\\maketitle" }),

	U.fmta({
		trig = "toc",
		wordTrig = true,
		dscr = "TOC entry",
		template = [[\addcontentsline{toc}{<>}{<>}]],
		nodes = { i(1, "section"), i(2, "Title") },
	}),

	U.s({ trig = "today", wordTrig = true, dscr = "Today's date", text = "\\today" }),
	U.s({ trig = "tex", wordTrig = true, dscr = "LaTeX logo", text = "\\LaTeX" }),
	U.s({ trig = "TeX", wordTrig = true, dscr = "TeX logo", text = "\\TeX" }),

	U.fmta({
		trig = "tbfr",
		wordTrig = true,
		dscr = "Beamer frame with title divider",
		template = [[% ──────────────────────────────── <> ──────────────────────────────
\begin{frame}\frametitle{<>}
  <>
\end{frame}]],
		nodes = { i(1, "Frame title"), rep(1), i(2) },
		condition = U.in_beamer,
	}),

	U.fmta({
		trig = "bfr",
		wordTrig = true,
		dscr = "Beamer frame with divider",
		template = [[% ──────────────────────────────────────────────────────────────────────
\begin{frame}
  <>
\end{frame}]],
		nodes = { i(1) },
		condition = U.in_beamer,
	}),

	U.fmta({
		trig = "frm",
		wordTrig = true,
		dscr = "Beamer frame",
		template = [[\begin{frame}{<>}\n  <>\n\\end{frame}]],
		nodes = { i(1, "Frame Title"), i(2, "") },
		condition = U.in_beamer,
	}),

	U.fmta({
		trig = "frmt",
		wordTrig = true,
		dscr = "Beamer frame with title",
		template = [[\begin{frame}\n  \frametitle{<>}\n  <>\n\\end{frame}]],
		nodes = { i(1, "Frame Title"), i(2, "") },
		condition = U.in_beamer,
	}),

	U.fmta({
		trig = "blk",
		wordTrig = true,
		dscr = "Beamer block",
		template = [[\begin{block}{<>}\n  <>\n\\end{block}]],
		nodes = { i(1, "Block Title"), i(2, "") },
		condition = U.in_beamer,
	}),

	U.fmta({
		trig = "ablk",
		wordTrig = true,
		dscr = "Beamer alert block",
		template = [[\begin{alertblock}{<>}\n  <>\n\\end{alertblock}]],
		nodes = { i(1, "Alert Title"), i(2, "") },
		condition = U.in_beamer,
	}),
})

local ls = require("luasnip")
local U = dofile(vim.fn.expand("~/snippets/tex/_utils.lua"))
local fmta = require("luasnip.extras.fmt").fmta
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node

ls.add_snippets("tex", {
	-- ============================================================
	-- MATH MACROS AND PACKAGES (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "macros",
		wordTrig = true,
		dscr = "Math macros and packages",
		template = [[
\usepackage{amsmath, amssymb, amsfonts}
\usepackage{mathtools}
\usepackage{derivative}
\usepackage{tensor}
\usepackage{physics}
\usepackage{dsfont}
\usepackage{mathrsfs}
\usepackage{bbm}

% --- Blackboard bold shortcuts ---
\newcommand{\1}{\mathbbm{1}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}

% --- Imaginary unit ---
\newcommand{\mi}{{i\mkern1mu}}

% --- Dirac notation ---
\newcommand{\up}{\ket{\uparrow}}
\newcommand{\down}{\ket{\downarrow}}

% --- Operators ---
\newcommand{\id}{\mathrm{id}}
\newcommand{\dg}{^\circ}
\newcommand{\surjto}{\twoheadrightarrow}
\newcommand{\injto}{\hookrightarrow}

\DeclareMathOperator{\supp}{supp}
\DeclareMathOperator{\img}{im}
\DeclareMathOperator{\Img}{Im}
\DeclareMathOperator{\coker}{coker}
\DeclareMathOperator{\Coker}{Coker}
\DeclareMathOperator{\Ker}{Ker}
\DeclareMathOperator{\Spec}{Spec}
\DeclareMathOperator{\pr}{pr}
\DeclareMathOperator{\ext}{ext}
\DeclareMathOperator{\pred}{pred}
\DeclareMathOperator{\dom}{dom}
\DeclareMathOperator{\cod}{cod}
\DeclareMathOperator{\ran}{ran}
\DeclareMathOperator{\Hom}{Hom}
\DeclareMathOperator{\Mor}{Mor}
\DeclareMathOperator{\End}{End}
\DeclareMathOperator{\diam}{diam}
\DeclareMathOperator*{\argmin}{arg min}
\DeclareMathOperator*{\argmax}{arg max}

% --- Geometry ---
\newcommand{\dang}{\measuredangle}
\newcommand{\ray}[1]{\overrightarrow{#1}}
\newcommand{\seg}[1]{\overline{#1}}
\newcommand{\arc}[1]{\wideparen{#1}}

% --- Category theory ---
\newcommand{\cat}[1]{\mathbf{#1}}
\newcommand{\Ob}[1]{\operatorname{Ob}(\cat{#1})}
\newcommand{\Obj}[1]{\cat{#1}_0}
\newcommand{\cHom}[3]{\Hom_{\mathbf{#1}}(#2,#3)}

% --- Delimiters ---
\newcommand{\mean}[1]{\left\langle{#1}\right\rangle}
\newcommand{\floor}[1]{\left\lfloor{#1}\right\rfloor}
\renewcommand{\norm}[1]{\left\lVert{#1}\right\rVert}]],
		nodes = {},
		condition = U.line_begin,
	}),

	-- ============================================================
	-- PREAMBLE TEMPLATE (manual - line_begin)
	-- Fixed: use fmta directly in choices, not U.fmta()
	-- ============================================================

	U.c({
		trig = "pre",
		wordTrig = true,
		dscr = "Preamble template",
		condition = U.line_begin,
		choices = {
			-- Article template
			fmta(
				[[
\documentclass[12pt,a4paper]{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{amsmath, amssymb, amsthm}
\usepackage{graphicx}
\usepackage{hyperref}

\title{<>}
\author{<>}
\date{\today}

\begin{document}
\maketitle

<>
\end{document}]],
				{ i(1, "Title"), i(2, "Author"), i(3) }
			),
			-- Minimal template
			fmta(
				[[
\documentclass[12pt,a4paper]{article}

\usepackage{amsmath, amssymb}

\begin{document}
<>
\end{document}]],
				{ i(1) }
			),
		},
	}),

	-- ============================================================
	-- LETTER TEMPLATE (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "letter",
		wordTrig = true,
		dscr = "Letter template",
		template = [[
\documentclass{letter}

\address{<>}
\signature{<>}

\begin{document}
\begin{letter}{<>}

\opening{<>}
<>
\closing{<>}

\end{letter}
\end{document}]],
		nodes = {
			i(1, "Your address"),
			i(2, "Your name"),
			i(3, "Recipient address"),
			i(4, "Dear Sir/Madam,"),
			i(5, "Letter content"),
			i(6, "Sincerely,"),
		},
		condition = U.line_begin,
	}),

	-- ============================================================
	-- BEAMER TEMPLATE (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "beamer",
		wordTrig = true,
		dscr = "Beamer presentation template",
		template = [[
\documentclass{beamer}

\usetheme{<>}
\usecolortheme{<>}

\title{<>}
\author{<>}
\date{\today}

\begin{document}
\begin{frame}
  \titlepage
\end{frame}

\begin{frame}{Outline}
  \tableofcontents
\end{frame}

<>
\end{document}]],
		nodes = {
			i(1, "Madrid"),
			i(2, "default"),
			i(3, "Presentation Title"),
			i(4, "Author"),
			i(5, "% Your frames here"),
		},
		condition = U.line_begin,
	}),

	-- ============================================================
	-- TIKZ TEMPLATE (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "tikztemp",
		wordTrig = true,
		dscr = "TikZ standalone template",
		template = [[
\documentclass[tikz,border=5pt]{standalone}
\usepackage{pgfplots}
\pgfplotsset{compat=1.18}

\begin{document}
\begin{tikzpicture}
  <>
\end{tikzpicture}
\end{document}]],
		nodes = { i(1, "% TikZ code") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- CUSTOM COMMANDS STUB (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "cmds",
		wordTrig = true,
		dscr = "Custom commands stub",
		template = [[
% --- Custom commands ---
\newcommand{\<>}[<>]{<>}]],
		nodes = { i(1, "cmd"), i(2, "1"), i(3) },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- TITLE BLOCK (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "title",
		wordTrig = true,
		dscr = "Title block",
		template = [[
\title{<>}
\author{<>}
\date{<>}
\maketitle]],
		nodes = { i(1, "Title"), i(2, "Author"), i(3, "\\today") },
		condition = U.line_begin,
	}),
})

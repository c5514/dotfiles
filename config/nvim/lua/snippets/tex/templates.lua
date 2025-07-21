local ls = require("luasnip")
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local rep = require("luasnip.extras").rep
local extras = require("luasnip.extras")
local l = extras.lambda
local postfix = require("luasnip.extras.postfix").postfix
local tex = {}
tex.in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

ls.add_snippets("tex", {
  s(
    { trig = "macros", dscr = "Math macros and packages" },
    fmta(
      [[
\usepackage{amsmath, amssymb, amsfonts}
\usepackage{mathtools}
\usepackage{derivative}
\usepackage{tensor}
\usepackage{physics}
\usepackage{dsfont}
\usepackage{mathrsfs}
\usepackage{bbm}
\newcommand{\1}{\mathbbm{1}}
\newcommand{\mi}{{i\mkern1mu}}%imaginary number
\newcommand{\up}{\ket{\uparrow}}
\newcommand{\down}{\ket{\downarrow}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\id}{\mathrm{id}}
\newcommand{\dg}{^\circ}
\newcommand{\surjto}{\twoheadrightarrow}
\newcommand{\injto}{\hookrightarrow}
\DeclareMathOperator\supp{supp}
\DeclareMathOperator{\img}{im} % Image
\DeclareMathOperator{\Img}{Im} % Image
\DeclareMathOperator{\coker}{coker} % Cokernel
\DeclareMathOperator{\Coker}{Coker} % Cokernel
\DeclareMathOperator{\Ker}{Ker} % Kernel
\DeclareMathOperator{\Spec}{Spec} % spectrum
\DeclareMathOperator{\pr}{pr} % projection
\DeclareMathOperator{\ext}{ext} % extension
\DeclareMathOperator{\pred}{pred} % predecessor
\DeclareMathOperator{\dom}{dom} % domain
\DeclareMathOperator{\cod}{cod} % codomain
\DeclareMathOperator{\ran}{ran} % range
\DeclareMathOperator{\Hom}{Hom} % homomorphism
\DeclareMathOperator{\Mor}{Mor} % morphisms
\DeclareMathOperator{\End}{End} % endomorphism
\DeclareMathOperator{\diam}{diam}
\DeclareMathOperator*{\argmin}{arg min}
\DeclareMathOperator*{\argmax}{arg max}
\newcommand{\dang}{\measuredangle} %% Directed angle
\newcommand{\ray}[1]{\overrightarrow{#1}}
\newcommand{\seg}[1]{\overline{#1}}
\newcommand{\arc}[1]{\wideparen{#1}}
\newcommand{\cat}[1]{\mathbf{#1}}
\newcommand{\Ob}[1]{\operatorname{Ob}(\cat{#1})}
\newcommand{\Obj}[1]{\cat{#1}_0}
\newcommand{\cHom}[3]{\Hom_{\mathbf{#1}}(#2,#3)}
\newcommand{\mean}[1]{\left\langle{#1}\right\rangle}
\newcommand{\floor}[1]{\left\lfloor{#1}\right\rfloor}
\renewcommand{\norm}[1]{\left\lVert{#1}\right\rVert}
    ]],
      {}
    )
  )
})

local ls = require("luasnip")
local U = dofile(vim.fn.expand("~/snippets/tex/_utils.lua"))
local i = ls.insert_node

ls.add_snippets("tex", {
	-- ============================================================
	-- BASIC TIKZ FIGURE (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "tikz",
		wordTrig = true,
		dscr = "TikZ figure environment",
		template = [[\begin{figure}[H]
  \centering
  \begin{tikzpicture}
    <>
  \end{tikzpicture}
  \caption{<>}
  \label{fig:<>}
\end{figure}]],
		nodes = { i(1, "% TikZ code"), i(2, "Caption"), i(3, "label") },
		condition = U.line_begin,
	}),

	-- ============================================================
	-- PGFPLOTS: BASIC PLOT (manual - line_begin)
	-- ============================================================

	U.fmta({
		trig = "plot",
		wordTrig = true,
		dscr = "PGFPlots figure",
		template = [[\begin{figure}[H]
  \centering
  \begin{tikzpicture}
    \begin{axis}[
      xlabel={<>},
      ylabel={<>},
      grid=major,
      legend pos=north west
    ]
      \addplot[blue, thick] {<>};
      \legend{<>}
    \end{axis}
  \end{tikzpicture}
  \caption{<>}
  \label{fig:<>}
\end{figure}]],
		nodes = {
			i(1, "x"),
			i(2, "y"),
			i(3, "x^2"),
			i(4, "f(x)"),
			i(5, "Plot caption"),
			i(6, "plot_label"),
		},
		condition = U.line_begin,
	}),

	-- ============================================================
	-- PGFPLOTS: SCATTER PLOT
	-- ============================================================

	U.fmta({
		trig = "scatter",
		wordTrig = true,
		dscr = "Scatter plot",
		template = [[\begin{tikzpicture}
  \begin{axis}[
    scatter/classes={a={mark=o,blue}, b={mark=square,red}},
    xlabel={<>},
    ylabel={<>}
  ]
    \addplot[scatter, only marks, scatter src=explicit symbolic]
    coordinates {
      <>
    };
  \end{axis}
\end{tikzpicture}]],
		nodes = { i(1, "x"), i(2, "y"), i(3, "(1,2) [a] (2,3) [b] (3,1) [a]") },
	}),

	-- ============================================================
	-- PGFPLOTS: 3D PLOT
	-- ============================================================

	U.fmta({
		trig = "plot3d",
		wordTrig = true,
		dscr = "3D surface plot",
		template = [[\begin{tikzpicture}
  \begin{axis}[
    view={60}{30},
    xlabel={x}, ylabel={y}, zlabel={z},
    grid=major,
    colormap/viridis
  ]
    \addplot3[surf, domain=<>:<>, samples=<>] {<>};
  \end{axis}
\end{tikzpicture}]],
		nodes = { i(1, "-2"), i(2, "2"), i(3, "20"), i(4, "x^2 + y^2") },
	}),

	-- ============================================================
	-- TREE DIAGRAM
	-- ============================================================

	U.fmta({
		trig = "tree",
		wordTrig = true,
		dscr = "Tree diagram",
		template = [[\begin{tikzpicture}[
  level distance=1.5cm,
  level 1/.style={sibling distance=3cm},
  level 2/.style={sibling distance=1.5cm}
]
  \node {<>}
    child { node {<>}
      child { node {<>} }
      child { node {<>} }
    }
    child { node {<>} };
\end{tikzpicture}]],
		nodes = {
			i(1, "Root"),
			i(2, "Child 1"),
			i(3, "Grandchild 1"),
			i(4, "Grandchild 2"),
			i(5, "Child 2"),
		},
	}),

	-- ============================================================
	-- BAR CHART
	-- ============================================================

	U.fmta({
		trig = "barchart",
		wordTrig = true,
		dscr = "Bar chart",
		template = [[\begin{tikzpicture}
  \begin{axis}[
    ybar,
    enlargelimits=0.15,
    ylabel={<>},
    xlabel={<>},
    symbolic x coords={<>},
    xtick=data,
    nodes near coords,
    nodes near coords align={vertical},
  ]
    \addplot coordinates {<>};
  \end{axis}
\end{tikzpicture}]],
		nodes = { i(1, "Values"), i(2, "Categories"), i(3, "A,B,C,D"), i(4, "(A,20) (B,25) (C,30) (D,15)") },
	}),

	-- ============================================================
	-- MATRIX VISUALIZATION
	-- ============================================================

	U.fmta({
		trig = "tikzmat",
		wordTrig = true,
		dscr = "Matrix with TikZ",
		template = [[\begin{tikzpicture}
  \matrix [matrix of math nodes, left delimiter=(, right delimiter=)] (m) {
    <>
  };
  <>
\end{tikzpicture}]],
		nodes = { i(1, "a & b \\\\ c & d"), i(2, "% Additional styling") },
	}),

	-- ============================================================
	-- AXIS ENVIRONMENT
	-- ============================================================

	U.fmta({
		trig = "axis",
		wordTrig = true,
		dscr = "Axis environment",
		template = [[\begin{axis}[
  xlabel={<>},
  ylabel={<>},
  grid=<>,
  legend pos=<>,
  width=<>,
  height=<>
]
  <>
\end{axis}]],
		nodes = {
			i(1, "x"),
			i(2, "y"),
			i(3, "major"),
			i(4, "north west"),
			i(5, "10cm"),
			i(6, "8cm"),
			i(7, "% plots here"),
		},
		condition = U.line_begin,
	}),

	-- ============================================================
	-- PARAMETRIC PLOT
	-- ============================================================

	U.fmta({
		trig = "param",
		wordTrig = true,
		dscr = "Parametric plot",
		template = [[\begin{tikzpicture}
  \begin{axis}[
    xlabel={x}, ylabel={y},
    axis equal, grid=major
  ]
    \addplot[blue, thick, domain=<>:<>, samples=<>] 
      ({<>}, {<>});
  \end{axis}
\end{tikzpicture}]],
		nodes = {
			i(1, "0"),
			i(2, "2*pi"),
			i(3, "100"),
			i(4, "cos(deg(x))"),
			i(5, "sin(deg(x))"),
		},
	}),

	-- ============================================================
	-- ANGLE MARKING
	-- ============================================================

	U.fmta({
		trig = "tikzangle",
		wordTrig = true,
		dscr = "Angle marking",
		template = [[\begin{tikzpicture}
  \coordinate (A) at (0,0);
  \coordinate (B) at (3,0);
  \coordinate (C) at (1.5,2);
  \draw (A) -- (B);
  \draw (A) -- (C);
  \draw pic[draw, angle radius=0.5cm, "$<>$"] {angle=B--A--C};
\end{tikzpicture}]],
		nodes = { i(1, "\\alpha") },
	}),

	-- ============================================================
	-- INLINE TIKZ
	-- ============================================================

	U.fmta({
		trig = "tikzinline",
		wordTrig = true,
		dscr = "Inline TikZ",
		template = [[\tikz{<>}]],
		nodes = { i(1, "\\draw (0,0) circle (0.1cm);") },
	}),
})

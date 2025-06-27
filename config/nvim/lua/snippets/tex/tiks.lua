local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("tex", {
	s(
		{ trig = "tikz", dscr = "Basic TikZ figure environment" },
		fmta(
			[[
      \begin{figure}[H]
      \centering
      \begin{tikzpicture}
      <>
      \end{tikzpicture}
      \caption{<>}
      \label{fig:<>}
      \end{figure}
    ]],
			{ i(1, "% TikZ code here"), i(2, "Caption"), i(3, "label") }
		)
	),
	s(
		{ trig = "plot", dscr = "Basic PGFPlots figure" },
		fmta(
			[[
      \begin{figure}[H]
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
      \end{figure}
    ]],
			{ i(1, "x"), i(2, "y"), i(3, "x^2"), i(4, "f(x)"), i(5, "Plot caption"), i(6, "plot_label") }
		)
	),
	s(
		{ trig = "scatter", dscr = "Scatter plot with PGFPlots" },
		fmta(
			[[
      \begin{tikzpicture}
      \begin{axis}[
          scatter/classes={a={mark=o,blue}, b={mark=square,red}},
          xlabel={<>},
          ylabel={<>}
      ]
      \addplot[scatter,only marks,scatter src=explicit symbolic]
      coordinates {
          <>
      };
      \end{axis}
      \end{tikzpicture}
    ]],
			{ i(1, "x"), i(2, "y"), i(3, "(1,2) [a] (2,3) [b] (3,1) [a]") }
		)
	),
	s(
		{ trig = "plot3d", dscr = "3D surface plot" },
		fmta(
			[[
      \begin{tikzpicture}
      \begin{axis}[
          view={60}{30},
          xlabel={x}, ylabel={y}, zlabel={z},
          grid=major,
          colormap/viridis
      ]
      \addplot3[surf,domain=<>:<>,samples=<>] {<>};
      \end{axis}
      \end{tikzpicture}
    ]],
			{ i(1, "-2"), i(2, "2"), i(3, "20"), i(4, "x^2 + y^2") }
		)
	),
	-- s(
	-- 	{ trig = "nodes", dscr = "Basic node diagram" },
	-- 	fmta(
	-- 		[[
	--      \begin{tikzpicture}[node distance=2cm]
	--      \node (<>) [rectangle, draw] {<>};
	--      \node (<>) [rectangle, draw, right of=<>] {<>};
	--      \draw[->] (<>) -- (<>);
	--      \end{tikzpicture}
	--    ]],
	-- 		{
	-- 			i(1, "node1"),
	-- 			i(2, "Node 1"),
	-- 			i(3, "node2"),
	-- 			i(4, "node1"),
	-- 			i(5, "Node 2"),
	-- 			i(6, "node1"),
	-- 			i(7, "node2"),
	-- 		}
	-- 	)
	-- ),
	s(
		{ trig = "tree", dscr = "Tree diagram" },
		fmta(
			[[
      \begin{tikzpicture}[level distance=1.5cm,
        level 1/.style={sibling distance=3cm},
        level 2/.style={sibling distance=1.5cm}]
      \node {<>}
        child {node {<>}
          child {node {<>}}
          child {node {<>}}
        }
        child {node {<>}};
      \end{tikzpicture}
    ]],
			{ i(1, "Root"), i(2, "Child 1"), i(3, "Grandchild 1"), i(4, "Grandchild 2"), i(5, "Child 2") }
		)
	),

	-- Bar chart
	s(
		{ trig = "barchart", dscr = "Bar chart with PGFPlots" },
		fmta(
			[[
      \begin{tikzpicture}
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
      \end{tikzpicture}
    ]],
			{ i(1, "Values"), i(2, "Categories"), i(3, "A,B,C,D"), i(4, "(A,20) (B,25) (C,30) (D,15)") }
		)
	),

	-- Matrix visualization
	s(
		{ trig = "matrix", dscr = "Matrix with TikZ" },
		fmta(
			[[
      \begin{tikzpicture}
      \matrix [matrix of math nodes,left delimiter=(,right delimiter=)] (m) {
        <> \\
      };
      <>
      \end{tikzpicture}
    ]],
			{ i(1, "a & b \\\\ c & d"), i(2, "% Additional styling") }
		)
	),

	-- Quick axis setup
	s(
		{ trig = "axis", dscr = "Axis environment for PGFPlots" },
		fmta(
			[[
      \begin{axis}[
          xlabel={<>},
          ylabel={<>},
          grid=<>,
          legend pos=<>,
          width=<>,
          height=<>
      ]
      <>
      \end{axis}
    ]],
			{ i(1, "x"), i(2, "y"), i(3, "major"), i(4, "north west"), i(5, "10cm"), i(6, "8cm"), i(7, "% plots here") }
		)
	),

	-- Parametric plot
	s(
		{ trig = "param", dscr = "Parametric plot" },
		fmta(
			[[
      \begin{tikzpicture}
      \begin{axis}[
          xlabel={x},
          ylabel={y},
          axis equal,
          grid=major
      ]
      \addplot[blue, thick, domain=<>:<>, samples=<>] 
      ({<>},{<>});
      \end{axis}
      \end{tikzpicture}
    ]],
			{ i(1, "0"), i(2, "2*pi"), i(3, "100"), i(4, "cos(deg(x))"), i(5, "sin(deg(x))") }
		)
	),

	-- Angle marking
	s(
		{ trig = "angle", dscr = "Angle marking in geometry" },
		fmta(
			[[
      \begin{tikzpicture}
      \coordinate (A) at (0,0);
      \coordinate (B) at (3,0);
      \coordinate (C) at (1.5,2);
      \draw (A) -- (B);
      \draw (A) -- (C);
      \draw pic[draw, angle radius=0.5cm, "$<>$"] {angle=B--A--C};
      \end{tikzpicture}
    ]],
			{ i(1, "\\alpha") }
		)
	),

	-- Quick TikZ inline
	s(
		{ trig = "tikzinline", dscr = "Inline TikZ picture" },
		fmta([[\tikz{<>}]], { i(1, "\\draw (0,0) circle (0.1cm);") })
	),
})

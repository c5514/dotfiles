local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")
local d = ls.dynamic_node

local rec_ls
rec_ls = function()
	return sn(nil, {
		c(1, {
			t({ "" }),
			sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
		}),
	});
end

local table_node
local rec_table
table_node = function(args)
	local tabs = {}
	local count
	table = args[1][1]:gsub("%s", ""):gsub("|", "")
	count = table:len()
	for j = 1, count do
		local iNode
		iNode = i(j)
		tabs[2 * j - 1] = iNode
		if j ~= count then
			tabs[2 * j] = t " & "
		end
	end
	return sn(nil, tabs)
end
rec_table = function()
	return sn(nil, {
		c(1, {
			t({ "" }),
			sn(nil, { t { "\\\\", "" }, d(1, table_node, { ai[1] }), d(2, rec_table, { ai[1] }) })
		}),
	});
end



ls.add_snippets('tex', {
	s({ trig = "env", dscr = "Begin environment" },
		fmta(
			[[
        \begin{<>}
           <>
        \end{<>}
      ]],
			{
				i(1),
				i(2),
				rep(1),
			}
		)
	),
	s({ trig = "item", dscr = "Itemize environment" }, {
		t({ "\\begin{itemize}",
			"\t\\item " }), i(1), d(2, rec_ls, {}),
		t({ "", "\\end{itemize}" }), i(0)
	}),
	-- s({ trig = "itm", dscr = "Add item" }, t("\\item ")),
	s({ trig = "enum", dscr = "Enumerate environment" }, {
		t({ "\\begin{enumerate}",
			"\t\\item " }), i(1), d(2, rec_ls, {}),
		t({ "", "\\end{enumerate}" }), i(0)
	}),
	s({ trig = "cent", dscr = "Center environment" },
		fmta(
			[[
        \begin{center}
           <>
        \end{center}
      ]],
			{
				i(1)
			}
		)),
	s({ trig = "fig", dscr = "Figure environment" },
		fmta(
			[[
        \begin{figure}[<>]
          \centering
          \includegraphics[width=<> \linewidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
      ]],
			{
				i(1, '!htpb'),
				i(2, '0.8'),
				i(3, 'name'),
				i(4, 'caption'),
				i(5, 'label')
			}
		)),
	s("tab", {
		t "\\begin{tabular}{",
		i(1, "0"),
		t { "}", "" },
		d(2, table_node, { 1 }, {}),
		d(3, rec_table, { 1 }),
		t { "", "\\end{tabular}" }
	}),
	s({ trig = "sec", dscr = "Display '\\section{}'" },
		fmta([[\section{<>}]], i(1))),
	s({ trig = "ssec", dscr = "Display '\\subsection{}'" },
		fmta([[\subsection{<>}]], i(1))),
	s({ trig = "sssec", dscr = "Display '\\subsubsection{}'" },
		fmta([[\subsubsection{<>}]], i(1))),
	s({ trig = "sec*", dscr = "Display '\\section**{}'" },
		fmta([[\section*{<>}]], i(1))),
	s({ trig = "ssec*", dscr = "Display '\\subsection**{}'" },
		fmta([[\subsection*{<>}]], i(1))),
	s({ trig = "sssec*", dscr = "Display '\\subsubsection**{}'" },
		fmta([[\subsubsection*{<>}]], i(1))),
	s({ trig = "part", dscr = "Display '\\part{}'" },
		fmta([[\part{<>}]], i(1))),
	s({ trig = "chap", dscr = "Display '\\chapter{}'" },
		fmta([[\chapter{<>}]], i(1))),
})

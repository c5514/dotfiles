local ls = require("luasnip")
local U = dofile(vim.fn.expand("~/snippets/tex/_utils.lua"))
local fmta = require("luasnip.extras.fmt").fmta
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local rep = require("luasnip.extras").rep

local function isempty(s)
	return s == nil or s == ""
end

local generate_label = function(args, parent, _, user_arg1, user_arg2)
	local delims = { "\\label{", "}" }
	if user_arg2 == "xargs" then
		delims = { "[", "]" }
	end

	if isempty(user_arg1) then
		return sn(nil, fmta([[\label{<>}]], { i(1) }))
	else
		return sn(
			nil,
			fmta([[<><>:<><>]], {
				t(delims[1]),
				t(user_arg1),
				i(1),
				t(delims[2]),
			})
		)
	end
end

local rec_ls
rec_ls = function()
	return sn(nil, {
		c(1, {
			t({ "" }),
			sn(nil, {
				t({ "", "\t\\item " }),
				i(1),
				d(2, rec_ls, {}),
			}),
		}),
	})
end

local function find_dynamic_node(node)
	while node and not node.dynamicNode do
		node = node.parent
	end
	return node and node.dynamicNode
end

local external_update_id = 0
function _G.dynamic_node_external_update(func_indx)
	local current_node = ls.session.current_nodes[vim.api.nvim_get_current_buf()]
	if not current_node then
		return
	end

	local dynamic_node = find_dynamic_node(current_node)
	if not dynamic_node then
		return
	end

	external_update_id = external_update_id + 1
	current_node.external_update_id = external_update_id
	local current_node_key = current_node.key

	local insert_pre_call = vim.fn.mode() == "i"
	local node_util = require("luasnip.nodes.util")
	local util = require("luasnip.util.util")

	local cursor_pos_end_relative = util.pos_sub(util.get_cursor_0ind(), current_node.mark:get_endpoint(1))

	node_util.leave_nodes_between(dynamic_node.snip, current_node)

	local func = dynamic_node.user_args[func_indx]
	if func then
		func(dynamic_node.parent.snippet)
	end

	dynamic_node.last_args = nil
	dynamic_node:update()

	local target_node = dynamic_node:find_node(function(test_node)
		return (test_node.external_update_id == external_update_id)
			or (current_node_key ~= nil and test_node.key == current_node_key)
	end)

	if target_node then
		node_util.enter_nodes_between(dynamic_node, target_node)
		if insert_pre_call then
			util.set_cursor_0ind(util.pos_add(target_node.mark:get_endpoint(1), cursor_pos_end_relative))
		else
			node_util.select_node(target_node)
		end
		ls.session.current_nodes[vim.api.nvim_get_current_buf()] = target_node
	else
		ls.session.current_nodes[vim.api.nvim_get_current_buf()] = dynamic_node.snip:jump_into(1)
	end
end

local function column_count_from_string(descr)
	return #(descr:gsub("[^clm]", ""))
end

local tab = function(args, snip)
	local cols = column_count_from_string(args[1][1])
	if not snip.rows then
		snip.rows = 1
	end

	local nodes = {}
	local ins_indx = 1
	for j = 1, snip.rows do
		table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
		ins_indx = ins_indx + 1
		for k = 2, cols do
			table.insert(nodes, t(" & "))
			table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
			ins_indx = ins_indx + 1
		end
		if j < snip.rows then
			table.insert(nodes, t({ "\\\\", "" }))
		end
	end

	return sn(nil, nodes)
end

ls.add_snippets("tex", {

	U.fmta({
		trig = "env",
		wordTrig = true,
		dscr = "Generic environment",
		template = [[\begin{<>}
  <>
\end{<>}]],
		nodes = { i(1, "environment"), i(2), rep(1) },
		condition = U.line_begin,
	}),

	U.n({
		trig = "item",
		wordTrig = true,
		dscr = "Itemize environment",
		nodes = {
			t({ "\\begin{itemize}", "\t\\item " }),
			i(1),
			d(2, rec_ls, {}),
			t({ "", "\\end{itemize}" }),
			i(0),
		},
		condition = U.line_begin,
	}),

	U.n({
		trig = "enum",
		wordTrig = true,
		dscr = "Enumerate environment",
		nodes = {
			t({ "\\begin{enumerate}", "\t\\item " }),
			i(1),
			d(2, rec_ls, {}),
			t({ "", "\\end{enumerate}" }),
			i(0),
		},
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "cent",
		wordTrig = true,
		dscr = "Center environment",
		template = [[\begin{center}
  <>
\end{center}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "quot",
		wordTrig = true,
		dscr = "Quote environment",
		template = [[\begin{quote} <>\end{quote}]],
		nodes = { i(1) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "fig",
		wordTrig = true,
		dscr = "Figure environment",
		template = [[\begin{figure}[<>]
  \centering
  \includegraphics[width=<>\linewidth]{<>}
  \caption{<>}
  \label{fig:<>}
\end{figure}]],
		nodes = {
			i(1, "!htpb"),
			i(2, "0.8"),
			i(3, "filename"),
			i(4, "caption"),
			i(5, "label"),
		},
		condition = U.line_begin,
	}),

	s(
		{ trig = "tab", wordTrig = true, dscr = "Table with dynamic rows" },
		fmta(
			[[\begin{table}[!htbp]
  \begin{tabular}{<>}
    <>
  \end{tabular}
  \caption{<>}
  \label{tab:<>}
\end{table}]],
			{
				i(1, "c c c"),
				d(2, tab, { 1 }, {
					user_args = {
						function(snip)
							snip.rows = (snip.rows or 1) + 1
						end,
						function(snip)
							snip.rows = math.max((snip.rows or 1) - 1, 1)
						end,
					},
				}),
				i(3, "caption"),
				i(4, "label"),
			}
		),
		{ condition = U.line_begin }
	),

	s(
		{ trig = "tab*", wordTrig = true, dscr = "Simple tabular" },
		fmta(
			[[\begin{tabular}{<>}
  <>
\end{tabular}]],
			{
				i(1, "c c c"),
				d(2, tab, { 1 }, {
					user_args = {
						function(snip)
							snip.rows = (snip.rows or 1) + 1
						end,
						function(snip)
							snip.rows = math.max((snip.rows or 1) - 1, 1)
						end,
					},
				}),
			}
		),
		{ condition = U.line_begin }
	),

	U.fmta({
		trig = "mini",
		wordTrig = true,
		dscr = "Side-by-side minipages",
		template = [[\begin{minipage}[t]{<>\textwidth}
  <>
\end{minipage}%
\hfill
\begin{minipage}[t]{<>\textwidth}
  <>
\end{minipage}]],
		nodes = { i(1, "0.45"), i(2), rep(1), i(3) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "sec",
		wordTrig = true,
		dscr = "Section",
		template = [[\section{<>}<>]],
		nodes = { i(1, "Title"), c(2, { t(""), d(1, generate_label, {}, { user_args = { "sec" } }) }) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "ssec",
		wordTrig = true,
		dscr = "Subsection",
		template = [[\subsection{<>}<>]],
		nodes = { i(1, "Title"), c(2, { t(""), d(1, generate_label, {}, { user_args = { "ssec" } }) }) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "sssec",
		wordTrig = true,
		dscr = "Subsubsection",
		template = [[\subsubsection{<>}<>]],
		nodes = { i(1, "Title"), c(2, { t(""), d(1, generate_label, {}, { user_args = { "sssec" } }) }) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "sec*",
		wordTrig = true,
		dscr = "Section (unnumbered)",
		template = [[\section*{<>}]],
		nodes = { i(1, "Title") },
		condition = U.line_begin,
	}),
	U.fmta({
		trig = "ssec*",
		wordTrig = true,
		dscr = "Subsection (unnumbered)",
		template = [[\subsection*{<>}]],
		nodes = { i(1, "Title") },
		condition = U.line_begin,
	}),
	U.fmta({
		trig = "sssec*",
		wordTrig = true,
		dscr = "Subsubsection (unnumbered)",
		template = [[\subsubsection*{<>}]],
		nodes = { i(1, "Title") },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "part",
		wordTrig = true,
		dscr = "Part",
		template = [[\part{<>}<>]],
		nodes = { i(1, "Title"), c(2, { t(""), d(1, generate_label, {}, { user_args = { "part" } }) }) },
		condition = U.line_begin,
	}),

	U.fmta({
		trig = "chap",
		wordTrig = true,
		dscr = "Chapter",
		template = [[\chapter{<>}<>]],
		nodes = { i(1, "Title"), c(2, { t(""), d(1, generate_label, {}, { user_args = { "chap" } }) }) },
		condition = U.line_begin,
	}),

	U.n({
		trig = "desc",
		wordTrig = true,
		dscr = "Description environment",
		nodes = {
			t({ "\\begin{description}", "\t\\item[" }),
			i(1, "label"),
			t({ "]", "\t\t" }),
			i(2),
			t({ "", "\\end{description}" }),
		},
		condition = U.line_begin,
	}),
})

local M = {}

function M.in_mathzone()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
function M.in_text()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end
function M.in_beamer()
	return vim.b.vimtex and vim.b.vimtex.documentclass == "beamer"
end

M.line_begin = require("luasnip.extras.expand_conditions").line_begin

local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta

-- Sensible defaults: manual trigger, not word-bound, normal priority
local default_opts = {
	wordTrig = false,
	priority = 10,
}

local function opts(var)
	var = var or {}
	local o = vim.deepcopy(default_opts)
	o.trig = var.trig
	o.dscr = var.dscr
	if var.wordTrig ~= nil then
		o.wordTrig = var.wordTrig
	end
	if var.regTrig ~= nil then
		o.regTrig = var.regTrig
	end
	if var.snippetType ~= nil then
		o.snippetType = var.snippetType
	end
	if var.opts then
		for k, v in pairs(var.opts) do
			o[k] = v
		end
	end
	return o
end

function M.s(var)
	var = var or {}
	return ls.snippet(opts(var), ls.text_node(var.text or ""), { condition = var.condition or M.in_mathzone })
end

function M.fmta(var)
	var = var or {}
	return ls.snippet(
		opts(var),
		fmta(var.template or "", var.nodes or {}),
		{ condition = var.condition or M.in_mathzone }
	)
end

function M.n(var)
	var = var or {}
	return ls.snippet(opts(var), var.nodes or {}, { condition = var.condition or M.in_mathzone })
end

function M.c(var)
	var = var or {}
	return ls.snippet(
		opts(var),
		{ ls.choice_node(1, var.choices or {}) },
		{ condition = var.condition or M.in_mathzone }
	)
end

function M.postfix(var)
	var = var or {}
	local postfix = require("luasnip.extras.postfix").postfix
	local extras = require("luasnip.extras")
	local lambda = extras.lambda

	return postfix(
		vim.tbl_extend("force", {
			trig = var.trig,
			-- match_pattern = var.match_pattern or [[[%w%.%_%-]+$]],
			match_pattern = var.match_pattern or [[\\?[%w%.%_%-]+$]],
			snippetType = "autosnippet",
			dscr = var.dscr,
		}, var.opts or {}),
		{ lambda(var.cmd .. "{" .. lambda.POSTFIX_MATCH .. "}") },
		{ condition = var.condition or M.in_mathzone }
	)
end

function M.env(var)
	var = var or {}
	return ls.snippet(
		opts(var),
		fmta(
			string.format([[\begin{%s}\n  <>\n\\end{%s}]], var.name, var.name),
			{ ls.insert_node(1, var.default or "") }
		),
		{ condition = var.condition or M.line_begin }
	)
end

function M.batch_simple(list)
	local snippets = {}
	for _, item in ipairs(list) do
		table.insert(snippets, M.s(item))
	end
	return snippets
end

function M.batch_autosnippet(list)
	local snippets = {}
	for _, item in ipairs(list) do
		item.opts = item.opts or {}
		item.opts.snippetType = "autosnippet"
		table.insert(snippets, M.s(item))
	end
	return snippets
end

function M.batch_postfix(list)
	local snippets = {}
	for _, item in ipairs(list) do
		table.insert(snippets, M.postfix(item))
	end
	return snippets
end

function M.isempty(s)
	return s == nil or s == ""
end

return M

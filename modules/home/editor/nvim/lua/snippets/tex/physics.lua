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
local tex = {}
tex.in_beamer = function()
  return vim.b.vimtex["documentclass"] == "beamer"
end
tex.in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

ls.add_snippets("tex", {
  s(
    { trig = "drc", wordTrig = false, dscr = "Dirac equation", snippetType = "autosnippet" },
    fmta([[(\mi \hbar \gamma^\mu \partial_\mu - mc )<> = 0]], { i(1, "\\psi(x,t)") }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "schr", wordTrig = false, dscr = "Schrödinger equation ", snippetType = "autosnippet" },
    c(1, {
      fmta([[\mi \hbar \frac{\partial }{\partial t} <> = <> <>]], { i(1, "\\psi(t)"), i(2, "\\hat{H}"), rep(1) }),
      fmta(
        [[\mi \hbar \frac{\partial }{\partial t} <> = \left[- \frac{\hbar^2}{2m}\frac{\partial^2 }{\partial x^2} + V(x, t)\right]<>]],
        { i(1, "\\psi(x,t)"), rep(1) })
    }),
    { condition = tex.in_mathzone }
  ),
})

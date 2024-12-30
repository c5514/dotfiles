local wezterm = require("wezterm")
local config = {}
config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "NONE"
config.cell_width = 0.90
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
  top = "0.5cell",
  right = "0cell",
  bottom = "0cell",
  left = "0cell",
}
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}
config.colors = {
  background = "#000000",
  foreground = "#b2b5b3",
  cursor_bg = "#b2b5b3",
  cursor_fg = "#000000",
  cursor_border = "#52ad70",
  selection_fg = "black",
}
config.default_cursor_style = "BlinkingBar"
config.font_size = 15
config.font = wezterm.font_with_fallback({
  -- {
  -- 	family = "Noto Sans Mono",
  -- 	weight = "Medium",
  -- 	italic = false,
  -- },
  "CaskaydiaMono NF",
})
config.font_rules = {
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font({
      family = "CaskaydiaMono NF",
      weight = "Bold",
      italic = false,
    }),
  },
  {
    italic = true,
    intensity = "Normal",
    font = wezterm.font({
      family = "CaskaydiaMono NF",
      weight = "Light",
      style = "Italic",
    }),
  },
  {
    italic = true,
    intensity = "Bold",
    font = wezterm.font({
      family = "CaskaydiaMono NF",
      weight = "DemiBold",
      style = "Italic",
    }),
  },
}
config.default_prog = { "tmux" }
return config

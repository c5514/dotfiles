local wezterm = require("wezterm")
local act = wezterm.action
local config = {}
-- config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"
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
config.color_scheme = 'Dark+'
config.colors = {
  background = "#0c090a",
  foreground = "#b2b5b3",
  cursor_bg = "#b2b5b3",
  cursor_fg = "#000000",
  cursor_border = "#52ad70",
  selection_fg = "black",
}
config.initial_rows = 50
config.initial_cols = 100
config.default_cursor_style = "BlinkingBar"
config.font_size = 14
config.font = wezterm.font_with_fallback({
  "JetBrainsMono NF",
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
config.keys = {
  {
    key = 'l',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitPane {
      direction = 'Left',
      size = { Percent = 50 },
    },
  },
  {
    key = 'h',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = 'j',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 },
    },
  },
  {
    key = 'k',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitPane {
      direction = 'Up',
      size = { Percent = 50 },
    },
  },
  {
    key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down',
  },
  {
    key = 'h', mods = 'CTRL|ALT', action = act.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'j', mods = 'CTRL|ALT', action = act.AdjustPaneSize { 'Down', 5 },
  },
  { key = 'k', mods = 'CTRL|ALT', action = act.AdjustPaneSize { 'Up', 5 } },
  {
    key = 'l', mods = 'CTRL|ALT', action = act.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'd',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'd',
    mods = 'CTRL|ALT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
}
config.default_prog = { "/usr/bin/fish", '-l' }
return config

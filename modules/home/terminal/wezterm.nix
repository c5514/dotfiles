{ lib, pkgs, ... }:
{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      hide_tab_bar_if_only_one_tab = true;
      cell_width = 0.90;
      window_close_confirmation = "NeverPrompt";
      window_padding = {
        top = "0.5cell";
        right = "0cell";
        bottom = "0cell";
        left = "0cell";
      };
      inactive_pane_hsb = {
        saturation = 0.9;
        brightness = 0.8;
      };
      colors = {
        background = "#121212";
        foreground = "#b2b5b3";
        cursor_bg = "#b2b5b3";
        cursor_fg = "#000000";
        cursor_border = "#52ad70";
        selection_fg = "black";
      };
      default_cursor_style = "BlinkingBar";
      font_size = 15;
      font = lib.generators.mkLuaInline ''wezterm.font_with_fallback({"CaskaydiaMono NF"})'';
      font_rules = [
        {
          intensity = "Bold";
          italic = false;
          font = lib.generators.mkLuaInline ''
            wezterm.font({
                    			family = "CaskaydiaMono NF",
                    			weight = "Bold",
                    			italic = false,
                    		})'';
        }
        {
          italic = true;
          intensity = "Normal";
          font = lib.generators.mkLuaInline ''
            wezterm.font({
                    			family = "CaskaydiaMono NF",
                    			weight = "Light",
                    			style = "Italic",
                    		})'';
        }
        {
          italic = true;
          intensity = "Bold";
          font = lib.generators.mkLuaInline ''
            wezterm.font({
                    			family = "CaskaydiaMono NF",
                    			weight = "DemiBold",
                    			style = "Italic",
                    		})'';
        }
      ];
    };
  };
  home.sessionVariables.TERMINAL = "wezterm";
}

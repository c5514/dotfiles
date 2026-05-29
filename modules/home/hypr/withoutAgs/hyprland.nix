{ pkgs, lib, ... }:
{
  imports = [
    ./rofi.nix
    ./wlogout/wlogout.nix
    # ./waybar/default.nix
  ];
  xdg.configFile = {
    "wal/templates/colors-hyprland.conf".source = ./colors-hyprland.conf;
  };
  home.packages = with pkgs; [
    pywal
    quickshell
    waypaper
  ];
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "waypaper --restore &"
        "quickshell"
      ];
      "$menu" = "rofi -show drun -theme ~/.config/rofi/launcher.rasi";
      "$clipboard" =
        "rofi -theme ~/.config/rofi/cliphist2.rasi -modi clipboard:cliphist-rofi-img -show clipboard -show-icons";
      source = "~/.cache/wal/colors-hyprland.conf"; # To enable pywal generated colors, must use waypaper, rofi and wlogout instead of ags
      general = {
        "col.active_border" = lib.mkForce "$color7 $color11 45deg";
        "col.inactive_border" = lib.mkForce "rgba(595959aa)";
      };
      bind = [
        "$mainMod, SPACE, exec, $menu"
        "$mainMod, W, exec, waypaper"
        "$mainMod SHIFT, W, exec, waypaper --random"
        "$mainMod, BACKSPACE, exec, wlogout"
        "$mainMod, V, exec, $clipboard"
        "$mainMod CTRL, V, exec, cliphist wipe"
      ];
      windowrule = [
        "match:class waypaper, float on"
      ];
    };
  };
}

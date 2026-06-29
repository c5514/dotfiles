{ pkgs, lib, ... }:
{
  imports = [
    ./rofi.nix
    # ./wlogout/wlogout.nix
    # ./waybar/default.nix
  ];
  xdg.configFile = {
    "wal/templates/colors-hyprland.conf".source = ./colors-hyprland.conf;
  };
  home.packages = with pkgs; [
    pywal
    quickshell
    matugen
    # waypaper
  ];
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        # "waypaper --restore &"
        "awww-daemon"
        "quickshell"
      ];
      # "$menu" = "rofi -show drun -theme ~/.config/rofi/launcher.rasi";
      "$menu" = "qs ipc call launcher toggle";
      "$wallpaper" = "qs ipc call wallpaper toggle";
      "$clipboard" =
        # "rofi -theme ~/.config/rofi/cliphist2.rasi -modi clipboard:cliphist-rofi-img -show clipboard -show-icons";
        "qs ipc call clipboard toggle";
      source = "~/.cache/wal/colors-hyprland.conf"; # To enable pywal generated colors, must use waypaper, rofi and wlogout instead of ags
      general = {
        "col.active_border" = lib.mkForce "$color7 $color11 45deg";
        "col.inactive_border" = lib.mkForce "rgba(595959aa)";
      };
      bind = [
        "$mainMod, SPACE, exec, $menu"
        "$mainMod, R, exec, qs ipc call picker toggle"
        "$mainMod, M, exec, qs ipc call theme toggle"
        # "$mainMod, W, exec, waypaper"
        "$mainMod, W, exec, $wallpaper"
        # "$mainMod SHIFT, W, exec, waypaper --random"
        # "$mainMod, BACKSPACE, exec, wlogout"
        "$mainMod, BACKSPACE, exec, qs ipc call powermenu toggle"
        "$mainMod, V, exec, $clipboard"
        "$mainMod CTRL, V, exec, cliphist wipe"
      ];
      windowrule = [
        "match:class waypaper, float on"
      ];
    };
  };
}

{ pkgs, inputs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  home.packages = with pkgs; [
    matugen
    fd
    bun
    dart-sass
    gtk3
    hyprpicker
    swappy
    slurp
    wayshot
    pywal
    sysstat # To find CPU usage
    alsa-utils # To enable sound for battery warning
  ];
  programs.ags = {
    enable = true;
    configDir = ./ags;
    extraPackages = with pkgs; [
      gtksourceview
      accountsservice
      webkitgtk_6_0
    ];
  };
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [ "ags & " ];
      bind = [
        "$mainMod, SPACE, exec, ags -t launcher"
        "$mainMod, BACKSPACE, exec, ags -t powermenu"
        "$mainMod, D, exec, ags -t datemenu"
        "$mainMod, M, exec, ags -t quicksettings"
        "$mainMod, V, exec, ags -r 'launcher.open(\":ch \")'"
        "$mainMod, O, exec, ags -t overview"
        "$mainMod CTRL, V, exec, cliphist wipe"
      ];
      windowrule = [
        "match:class com.github.Aylur.ags, float on, size 30% 45%"
      ];
    };
  };
}

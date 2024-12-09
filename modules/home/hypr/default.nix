{ pkgs, ... }:
{
  imports = [
    ./withAgs/hyprland.nix
    ./withAgs/ags.nix
    ./hypridle.nix
    ./hyprlock.nix
    # ./withoutAgs/rofi.nix
    # ./withoutAgs/wlogout/wlogout.nix
    # ./withoutAgs/waybar/default.nix
  ];
  home.packages = with pkgs; [
    # waypaper
    # grimblast
    hyprsunset
  ];
}

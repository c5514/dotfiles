{
  imports = [
    ./withAgs/hyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./withoutAgs/rofi.nix
    ./withoutAgs/wlogout/wlogout.nix
    ./withoutAgs/waybar/default.nix
  ];
  home.packages = with pkgs; [
    waypaper
  ];
}

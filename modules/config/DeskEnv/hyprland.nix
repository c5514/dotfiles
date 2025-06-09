{ pkgs, ... }:
{
  # Hyprland modules
  programs = {
    hyprland.enable = true;
    hyprlock.enable = true;
  };
  environment.systemPackages = with pkgs; [
    hyprshade
    xfce.thunar
    evince
  ];
}

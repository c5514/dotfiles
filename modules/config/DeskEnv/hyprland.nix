{ pkgs, ... }:
{
  # Hyprland modules
  programs = {
    hyprland = {
      withUWSM = true;
      enable = true;
    };
    hyprlock.enable = true;
  };
  environment.systemPackages = with pkgs; [
    hyprshade
    # xfce.thunar
    nautilus
    evince
  ];
}

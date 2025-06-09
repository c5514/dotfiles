{ pkgs, ... }:
{
  # services.xserver.windowManager.dwm.enable = true;
  environment.systemPackages = with pkgs; [
    foot
    dwl
    # st
    # rofi
  ];
}

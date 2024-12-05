{ pkgs, ... }:
{
  programs.rofi.enable = true;
  programs.rofi.package = pkgs.rofi-wayland;
  xdg.configFile = {
    "wal/templates/colors-rofi.rasi".text = ''
      * {{
                background: rgba(0,0,1,0.5);
                foreground: #FFFFFF;
                color0:     {color0};
                color1:     {color1};
                color2:     {color2};
                color3:     {color3};
                color4:     {color4};
                color5:     {color5};
                color6:     {color6};
                color7:     {color7};
                color8:     {color8};
                color9:     {color9};
                color10:    {color10};
                color11:    {color11};
                color12:    {color12};
                color13:    {color13};
                color14:    {color14};
                color15:    {color15};
            }}
    '';
    "rofi/launcher.rasi".source = ./rofi/launcher.rasi;
    "rofi/custom_theme.rasi".source = ./rofi/custom_theme.rasi;
    "rofi/cliphist.rasi".source = ./rofi/cliphist.rasi;
    "rofi/cliphist2.rasi".source = ./rofi/cliphist2.rasi;
    "rofi/wallpaper-select.rasi".source = ./rofi/wallpaper-select.rasi;
  };
}

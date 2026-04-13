{ inputs, pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = false;
        ignore_empty_input = true;
        no_fade_in = true;
      };
      background = {
        monitor = "";
        path = "~/Pictures/Nix/Field.jpg";
        blur_passes = 4;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;
      };
      input-field = [
        {
          monitor = "";
          size = "320, 55";
          outline_thickness = 2;
          dots_size = 0.15;
          dots_spacing = 0.3;
          dots_center = true;
          dots_rounding = -1;
          outer_color = "rgb(151515)";
          inner_color = "rgb(216,222,233,0.6)";
          font_color = "rgb(121212)";
          fade_on_empty = false;
          hide_input = false;
          placeholder_text = ''<i><span foreground="##ffffff99"></span></i>'';
          check_color = "rgb(204, 136, 34)";
          fail_color = "rgb(204, 34, 34)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          fail_transition = 200;
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          invert_numlock = false;
          swap_font_color = false;
          position = "0, -220";
          halign = "center";
          valign = "center";
        }
      ];
      label = [
        {
          monitor = "";
          text = "Welcome!";
          color = "rgba(216,222,233,0.9)";
          font_size = 55;
          font_family = "Font Awesome";
          position = "0, 320";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          #clock
          text = ''cmd[update:1000] echo "$TIME"'';
          color = "rgba(216, 222, 233, 0.9)";
          font_size = 60;
          font_family = "Font Awesome";
          position = "0, 240";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
          color = "rgba(216,222,233,0.9)";
          font_size = 19;
          font_family = "Font Awesome";
          position = "0, 165";
          hlign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "    $USER";
          color = "rgb(ffffff)";
          outline_thickness = 0;
          dots_size = "0.2";
          dots_spacing = true;
          font_size = 16;
          font_family = "Font Awesome";
          position = "0, -140";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] bash -c 'playerctl metadata && echo -e "    $(playerctl metadata artist)   -   $(playerctl metadata title)"' | tail -n 1'';
          color = "rgba(255,255,255,0.65)";
          font_size = 14;
          font_family = "JetBrains Mono Nerd, Noto Sans";
          position = "0, 45";
          halign = "center";
          valign = "bottom";
        }
      ];
      shape = [
        {
          monitor = "";
          size = "320, 55";
          color = "rgb(121212)";
          rounding = "-1";
          border_size = 0;
          border_color = "rgba(255,255,255,1)";
          rotate = 0;
          xray = false;
          position = "0, -140";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}

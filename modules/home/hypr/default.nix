{ pkgs, lib, ... }:
{
  imports = [
    # ./withAgs/ags.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./withoutAgs/hyprland.nix
  ];
  home.packages = with pkgs; [
    grimblast
    hyprsunset
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
    settings = {
      monitor = [
        "eDP-1,preferred,auto,1"
        ", preferred, auto, 1, mirror, eDP-1"
      ];
      exec-once = [
        "hypridle &"
        "hyprsunset -t 3500"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dbus-update-activation-environment --systemd --all"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];
      env = [
        "HYPRCURSOR_THEME, Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE, 24"
        "XCURSOR_THEME, Bibata-Modern-Ice"
        "XCURSOR_SIZE,24"
        "GDK_BACKEND,wayland,x11,*"
        "QT_QPA_PLATFORM,wayland;xcb"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "WAYLAND_DISPLAY,wayland-1"
      ];
      #Programs
      "$terminal" = "wezterm";
      "$fileManager" = "~/Scripts/yazi.sh";
      "$fileManager2" = "nautilus";
      "$browser" = "firefox";
      "$latex" = "~/Scripts/quick-latex.sh";
      #Input
      input = {
        kb_layout = "us";
        kb_variant = "altgr-intl";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
        numlock_by_default = true;
      };
      #General
      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 3;
        "col.active_border" = lib.mkDefault "rgba(49A0E6FF)";
        "col.inactive_border" = lib.mkDefault "rgba(595959aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };
      #Dwindle and Master
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      master = {
        new_status = "master";
      };
      #Decoration
      decoration = {
        rounding = 15;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 0.9;
        shadow = {
          enabled = true;
          color = "rgba(1a1a1aee)";
          render_power = 3;
          range = 3;
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      #Animations
      animations = {
        enabled = true;
        bezier = [
          "linear, 0, 0, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92"
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1" # use with .2s duration
        ];
        animation = [
          "windows, 1, 3, md3_decel, popin 60%"
          "windowsIn, 1, 3, md3_decel, popin 60%"
          "windowsOut, 1, 3, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layers, 1, 2, md3_decel, slide"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      #Keybindings
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod SHIFT, E, exec, $fileManager2"
        "$mainMod, B, exec, $browser"
        "$mainMod SHIFT, B, exec, brave"
        "$mainMod ALT, B, exec, tor-browser"
        "$mainMod ALT, L, exec, hyprlock"
        "$mainMod, R, exec, $latex"
        "$mainMod, N, exec,  if hyprshade current | grep -q 'blue-light-filter'; then hyprshade off; else hyprshade on blue-light-filter; fi"
        #Screenshot
        # ", PRINT, exec, grimblast copy area"
        # "$mainMod, PRINT, exec, grimblast copy active"
        # "$mainMod SHIFT, PRINT, exec, grimblast copy screen"
        ", XF86Cut, exec, grimblast copy area"
        "$mainMod, XF86Cut, exec, grimblast copy active"
        "$mainMod SHIFT, XF86Cut, exec, grimblast copy screen"
        #Window management
        "$mainMod, F, fullscreen, 1"
        "$mainMod SHIFT, F, fullscreen, 0"
        "$mainMod CTRL, F, togglefloating"
        "$mainMod, P, pseudo,"
        "$mainMod, T, layoutmsg, togglesplit"
        "$mainMod, T, layoutmsg, colresize +conf"
        #Change focus of windows
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        #Switch windows
        "$mainMod CTRL, L, swapwindow, r"
        "$mainMod CTRL, H, swapwindow, l"
        "$mainMod CTRL, K, swapwindow, u"
        "$mainMod CTRL, J, swapwindow, d"
        #Resize active panel
        "$mainMod SHIFT, L, resizeactive, 40 0"
        "$mainMod SHIFT, H, resizeactive, -40 0"
        "$mainMod SHIFT, K, resizeactive, 0 -40"
        "$mainMod SHIFT, J, resizeactive, 0 40"
        #Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        #Move active window to a workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        #Special workspace
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspacesilent, special:magic"
        #Scroll through existing workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        #Move through existing workspaces
        "$mainMod, Tab, workspace, previous"
        #Change window focus on a workspace
        "ALT, Tab, cyclenext, none"
        "ALT, Tab, alterzorder, top"
        "ALT, Tab, layoutmsg, cyclenext"
        "ALT SHIFT, Tab, cyclenext, prev"
        "ALT SHIFT, Tab, alterzorder, top"
        "ALT SHIFT, Tab, layoutmsg, cycleprev"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindl = [
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
      bindle = [
        ", XF86MonBrightnessUp, exec, brightnessctl -q s 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
      ];
      workspace = [
        "1, layout:monocle"
        "2, layout:scrolling"
        "3, layout:scrolling"
        "6, layout:scrolling"
        "8, layout:monocle"
      ];
      windowrule =
        let
          f = regex: "match:class ${regex}$, float on";
          i = regex: "match:class ${regex}$, idle_inhibit focus";
        in
        [
          (f "org.gnome.Calculator")
          (f "org.gnome.Weather")
          (f "org.gnome.Settings")
          (f "org.gnome.Nautilus")
          (f "xdg-desktop-portal-gtk")
          (f "com.github.wwmm.easyeffects")
          (f "thunar")
          (f "org.pulseaudio.pavucontrol")
          (f "feh")
          (f "Zotero")
          (i "org.pwmt.zathura")
          (i "org.gnome.Evince")
          (i "com.mitchellh.ghostty")
          (i "foot")
          (i "wezterm")
          (i "spotify")
          (i "firefox")
          "match:class org.gnome.Evince, workspace 3 silent"
          "match:class org.inkscape.Inkscape, workspace 5 silent"
          "match:class Telegram, workspace 6 silent"
          "match:class spotify, workspace 7 silent, float on, size 910 540, move 20 80"
          "match:class Tor Browser, workspace 8"
          "match:class foot, match:title quick-latex, float on, size 540 540, move 400 200"
          "match:class __main__.py, match:xwayland true, float on, move = 100 200"
          "match:class nm-connection-editor, float on, size 35% 60%"
          "match:class nz.co.mega, float on, size 40% 50%"
          "suppress_event maximize, match:class .*"
        ];
    };
  };
}

{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    clipboard-indicator
    app-icons-taskbar
    bluetooth-quick-connect
    quick-settings-tweaker
    tray-icons-reloaded
    vitals
    no-title-bar
    user-themes
  ];
  dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
        font-name = "CaskaydiaMono Nerd Font, 12";
      };
      "org/gnome/shell/keybindings" = {
        toggle-quick-settings = [ "<Super>m" ];
        toggle-message-tray = [ "<Super>d" ];
        toggle-overview = [ "<Super>r" ];
      };
      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>q" ];
        toggle-maximized = [ "<Super>f" ];
        toggle-fullscreen = [ "<Shift><Super>f" ];
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-5 = [ "<Super>5" ];
        switch-to-workspace-6 = [ "<Super>6" ];
        switch-to-workspace-7 = [ "<Super>7" ];
        switch-to-workspace-8 = [ "<Super>8" ];
        switch-to-workspace-9 = [ "<Super>9" ];
        switch-to-workspace-10 = [ "<Super>0" ];
        move-to-workspace-1 = [ "<Shift><Super>1" ];
        move-to-workspace-2 = [ "<Shift><Super>2" ];
        move-to-workspace-3 = [ "<Shift><Super>3" ];
        move-to-workspace-4 = [ "<Shift><Super>4" ];
        move-to-workspace-5 = [ "<Shift><Super>5" ];
        move-to-workspace-6 = [ "<Shift><Super>6" ];
        move-to-workspace-7 = [ "<Shift><Super>7" ];
        move-to-workspace-8 = [ "<Shift><Super>8" ];
        move-to-workspace-9 = [ "<Shift><Super>9" ];
        move-to-workspace-10 = [ "<Shift><Super>0" ];
      };
      "org/gnome/desktop/peripherals/mouse" = {
        natural-scroll = false;
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        two-finger-scrolling-enabled = true;
        natural-scroll = false;
      };
      "org/gnome/shell/extensions/user-theme" = {
        name = "Orchis-Dark";
      };
      "org/gnome/shell" = {
        favorite-apps = [
          "firefox.desktop"
          "org.wezfurlong.wezterm.desktop"
          "spotify.desktop"
          "org.gnome.Nautilus.desktop"
          "org.telegram.desktop.desktop"
          "vesktop.desktop"
          "org.gnome.Settings.desktop"
        ];
        disable-user-extensions = false;
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "bluetooth-quick-connect@bjarosze.gmail.com"
          "clipboard-indicator@tudmotu.com"
          "aztaskbar@aztaskbar.gitlab.com"
          "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
          "quick-settings-tweaker@gnome-shell-extensions.gcampax.github.com"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          # "no-title-bar@franglais125"
          "Vitals@CoreCoding.com"
          "trayIconsReloaded@selfmade.pl"
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        show-battery-percentage = true;
      };
      "org/gnome/desktop/screensaver" = {
        picture-uri = "file:///home/c5514/Pictures/Nix/nixwall.png";
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file:///home/c5514/Pictures/Nix/nixwall.png";
        picture-uri-dark = "file:///home/c5514/Pictures/Nix/nixwall.png";
        primary-color = "#3465a4";
      };
    };
  };
}

{ pkgs, ... }:
{

  services.xserver = {
    enable = true;
    desktopManager = {
      gnome.enable = true;
      xterm.enable = false;
    };
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
  programs.dconf.profiles.gdm.databases = [
    {
      settings = {
        "org/gnome/desktop/peripherals/touchpad" = {
          tap-to-click = true;
        };
        "org/gnome/desktop/interface" = {
          cursor-theme = "Bibata-Modern-Ice";
          show-battery-percentage = true;
        };
      };
    }
  ];
  users.users.gdm.packages = with pkgs; [
    bibata-cursors
  ];
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "wezterm";
  };
  environment = {
    gnome.excludePackages = with pkgs; [
      gnome-console
      gnome-photos
      gnome-tour
      gnome-connections
      snapshot
      gedit
      cheese
      epiphany
      geary
      totem
      # evince
      yelp
      # gnome-font-viewer
      gnome-text-editor
      gnome-music
      gnome-characters
      tali
      iagno
      hitori
      atomix
      gnome-contacts
      gnome-maps
    ];
  };
}

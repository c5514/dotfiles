{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/config/bootloader.nix
    ../../modules/config/Utils/default.nix
    ../../modules/config/Network/default.nix
    ../../modules/config/DeskEnv/gnome.nix
    # ../../modules/config/DeskEnv/hyprland.nix
  ];

  # Set your time zone.
  time.timeZone = "America/Lima";
  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
  console = {
    earlySetup = true;
    font = "ter-v20n";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };
  #Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
    videoDrivers = [ "amdgpu" ];
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    i2c.enable = true;
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.c5514 = {
    isNormalUser = true;
    description = "Cesar Levano";
    extraGroups = [
      "networkmanager"
      "wheel"
      "scanner"
      "lp"
    ];
    shell = pkgs.fish;
    # packages = with pkgs; [
    # ];
  };
  programs = {
    fish.enable = true;
    firefox.enable = true;
    dconf.enable = true;
  };
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    git
    brightnessctl
    wl-clipboard
    playerctl
    pavucontrol
    cliphist
    htop
    unzip
    material-design-icons
    fastfetch
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    fira-sans
    font-awesome
    material-icons
    jetbrains-mono
    freefont_ttf
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "CascadiaMono"
        "NerdFontsSymbolsOnly"
      ];
    })
  ];
  security.polkit.enable = true;
  services = {
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    libinput.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };
  xdg.portal.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}

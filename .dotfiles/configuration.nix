# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, pkgs-unstable, grub2-themes, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.devices = ["nodev"];
  # boot.loader.grub.useOSProber = true;
  # boot.loader.grub.font = "${pkgs.grub2}/share/grub/unicode.pf2";
  boot.loader.grub2-theme = {
  	enable = true;
	theme = "vimix";
	footer = true;
  };
  boot.loader.grub.fontSize = 24;
  boot.loader.systemd-boot.enable = false;
  boot.plymouth = {
  	enable = true;
	theme = "rings";
	themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
  };
  # boot.consoleLogLevel = 0;
  # boot.initrd.verbose = false;
  boot.kernelParams = [
  	"quiet"
  	"splash"
	"boot.shell_on_fail"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
  ];
  # boot.loader.timeout = 0;

  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Lima";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    font = "ter-v20n";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };

  # Configure keymap in X11
  services.xserver = {
  	# enable = true;
    layout = "us";
    xkbVariant = "altgr-intl";
    videoDrivers = [ "amdgpu" ];
	# displayManager.gdm.enable = true;
	# displayManager.gdm.wayland = true;
  };

  hardware.opengl = {
	enable = true;
	driSupport = true;
	driSupport32Bit = true;
};
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.c5514 = {
    isNormalUser = true;
    description = "Cesar Levano";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  programs.zsh.enable = true;
  users.users.c5514.shell = pkgs.zsh;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Hyprland modules
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  programs.hyprland.xwayland.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
environment.systemPackages = 
  (with pkgs; [
    firefox
    grim
    slurp
    rofi-wayland
    waypaper
    brightnessctl
    kitty
    cliphist
    htop
    unzip
    texliveFull
    wlogout
    pywal
    zathura
    telegram-desktop
    material-design-icons
    pavucontrol
    gnome.nautilus
    wl-clipboard
    playerctl
    feh
    pavucontrol
    obs-studio
    libreoffice-qt6-fresh
    thunderbird
    spotify
    vlc
    hyprland
    hyprpaper
    hyprshade
    xdg-desktop-portal-hyprland
	usbutils
	udiskie
	udisks
  ])
  ++
  (with pkgs-unstable; [
    fastfetch
  ]);
fonts.packages = with pkgs;[
	noto-fonts
	noto-fonts-cjk-sans
	noto-fonts-emoji
	fira-code
	fira-code-symbols
	fira-sans
	font-awesome
	jetbrains-mono
	freefont_ttf
	(nerdfonts.override {fonts = ["JetBrainsMono"];})
];
xdg.portal.enable = true;
xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
sound = {
       enable=false;
       mediaKeys.enable = true;
};
security.rtkit.enable = true;
services.pipewire = {
     enable = true;
     pulse.enable = true;
     alsa = {
     	enable = true;
	support32Bit = true;
     };
     jack.enable = true;
};
security.polkit.enable = true;
services.printing.enable=true;
services.printing.drivers = [ pkgs.epson-escpr ];
hardware.printers = {
    ensurePrinters = [
    {
    name = "EPSON-L3150";
	  location = "Home";
	  deviceUri = "usb://EPSON/L3150%20Series?serial=583747513238373737&interface=1";
	  model = "epson-inkjet-printer-escpr/Epson-L3150_Series-epson-escpr-en.ppd";
	  ppdOptions = {
	    PageSize = "A4";
	    };
    }
  ];
};
services.power-profiles-daemon.package = pkgs.power-profiles-daemon;
services.power-profiles-daemon.enable = true;

services.upower.package = pkgs.upower;
services.upower.enable = true;
#To enable trash support in nautilus
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  # services.tlp = {
  #   enable = true;
  #   settings = {
  #     CPU_SCALING_GOVERNOR_ON_AC = "performance";
  #     CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #     CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
  #     CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
  #     CPU_MIN_PERF_ON_AC = 0;
  #     CPU_MIN_PERF_ON_BAT = 0;
  #     CPU_MAX_PERF_ON_AC = 100;
  #     CPU_MAX_PERF_ON_BAT = 50;
  #     START_CHARGE_THRESH_BAT0 = 40;
  #     STOP_CHARGE_THRESH_BAT0 = 80;
  #   };
  # };
  powerManagement.powertop.enable = true;
#Enable Display Manager sddm
services.displayManager.sddm = {
    enable = true; # Enable SDDM.
	wayland.enable = true;
    sugarCandyNix = {
        enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
        settings = {
          # Set your configuration options here.
          # Here is a simple example:
          Background = lib.cleanSource ./nixwall.png;
          ScreenWidth = 1920;
          ScreenHeight = 1080;
          FormPosition = "left";
          HaveFormBackground = true;
          PartialBlur = true;
          # ...
        };
      };
    };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

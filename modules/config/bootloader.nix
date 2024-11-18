{ pkgs, inputs, ... }:

{
  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        devices = [ "nodev" ];
        useOSProber = true;
        fontSize = 24;
      };
      grub2-theme = {
        enable = true;
        theme = "tela";
        footer = true;
        icon = "color";
      };
      systemd-boot.enable = false;
    };
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };
    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      kernelModules = [ "amdgpu" ];
    };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };
}

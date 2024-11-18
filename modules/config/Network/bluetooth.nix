{ pkgs, ... }:
{
  #Bluetooth services
  environment.systemPackages = with pkgs; [
    bluez
    bluez-tools
  ];
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
    powerOnBoot = false;
    settings.General.Experimental = true;
    # services.blueman.enable = true;
  };
}

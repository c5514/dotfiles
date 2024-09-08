{ config, lib, pkgs, pkgs-unstable, grub2-themes,... }:

{
	#Bluetooth services
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = false;
	services.blueman.enable = true;
}

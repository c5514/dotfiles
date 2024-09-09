{ config, lib, pkgs, pkgs-unstable, grub2-themes,... }:

{
	#Bluetooth services
	environment.systemPackages = with pkgs; [
		bluez
		bluez-tools
	];
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = false;
	# services.blueman.enable = true;
	hardware.bluetooth.package = pkgs.bluez;
}

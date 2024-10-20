{ pkgs,... }:

{
	#Bluetooth services
	environment.systemPackages = with pkgs; [
		bluez
		bluez-tools
	];
	hardware.bluetooth.enable = true;
	hardware.bluetooth.powerOnBoot = false;
	hardware.bluetooth.settings.General.Experimental = true;
	# services.blueman.enable = true;
	hardware.bluetooth.package = pkgs.bluez;
}

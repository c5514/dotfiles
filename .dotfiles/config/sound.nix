{ config, lib, pkgs, grub2-themes,... }:

{
	# sound = {
	# 	enable=false;
	# 	mediaKeys.enable = true;
	# };
	hardware.alsa.enablePersistence = true;
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
}

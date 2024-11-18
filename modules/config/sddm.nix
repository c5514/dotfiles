{ config, lib, pkgs, ... }:

{
	services.displayManager.sddm = {
		enable = true; # Enable SDDM.
		wayland.enable = true;
		sugarCandyNix = {
			enable = true;
			settings = {
				Background = lib.cleanSource ./nixwall.png;
				ScreenWidth = 1920;
				ScreenHeight = 1080;
				FormPosition = "left";
				HaveFormBackground = true;
				PartialBlur = true;
			};
		};
	};
}

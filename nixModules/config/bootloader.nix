{ pkgs, inputs,... }:

{
	#Bootloader.
	#boot.loader.systemd-boot.enable = true;
	#boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.grub.enable = true;
	boot.loader.grub.efiSupport = true;
	boot.loader.grub.efiInstallAsRemovable = true;
	boot.loader.grub.devices = ["nodev"];
#	boot.loader.grub.useOSProber = true;
	boot.loader.grub2-theme = {
		enable = true;
		theme = "tela";
		footer = true;
		icon = "color";
	};
	boot.loader.grub.fontSize = 24;
	boot.loader.systemd-boot.enable = false;
	#Plymouth
	boot.plymouth = {
		enable = true;
		theme = "rings";
		themePackages = with pkgs; [
			(adi1090x-plymouth-themes.override {
			selected_themes = [ "rings" ];
    		})
		];
	};
	boot.consoleLogLevel = 0;
	boot.initrd.verbose = false;
	boot.kernelParams = [
		"quiet"
		"splash"
		"boot.shell_on_fail"
    	"loglevel=3"
    	"rd.systemd.show_status=false"
    	"rd.udev.log_level=3"
    	"udev.log_priority=3"
	];
	#boot.loader.timeout = 0;
	boot.initrd.kernelModules = [ "amdgpu" ];
}

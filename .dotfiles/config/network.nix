{pkgs, ...}:
{
	networking.hostName = "nixos"; # Define your hostname.
	# networking.wireless.iwd.enable = true;  # Enables wireless support via wpa_supplicant.
	# networking.wireless.iwd.settings = {
 #    	IPv6 = {
 #    		Enabled = true;
 #    	};
 #    	Settings = {
 #    		AutoConnect = true;
 #    	};
	# };
	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;
	# networking.networkmanager.wifi.backend = "iwd";
	# environment.systemPackages = (with pkgs; [
	# 	iwgtk
	# ]);
}

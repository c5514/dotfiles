{pkgs,...}:
{
	imports = [
		./wifi.nix
		./firewall.nix
		./bluetooth.nix
	];
}

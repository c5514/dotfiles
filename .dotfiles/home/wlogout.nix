{pkgs, lib,...}:

{
	programs.wlogout.enable = true;
	programs.wlogout.package = pkgs.wlogout;
}

{pkgs, ...}:
{
	hardware.sane.enable = true;
	hardware.sane.extraBackends = [ pkgs.epkowa ];
}

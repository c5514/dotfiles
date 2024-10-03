{pkgs,...}:
{
	programs.tmux = {
		enable = true;
		clock24 = true;
		escapeTime = 0;
		historyLimit = 100000;
		shortcut = "a";
		keyMode = "vi";
	};
}

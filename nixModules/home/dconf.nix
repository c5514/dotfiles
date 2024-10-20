{pkgs,...}:
{
	home.packages = with pkgs.gnomeExtensions; [
		blur-my-shell
		clipboard-indicator
		app-icons-taskbar
		bluetooth-quick-connect
		quick-settings-tweaker
		# forge
	];
	dconf = {
		settings = {
			"org/gnome/desktop/peripherals/mouse" = {
				natural-scroll = false;
			};
			"org/gnome/desktop/peripherals/touchpad" = {
				two-finger-scrolling-enabled = true;
				natural-scroll = false;
			};
			"org/gnome/shell" = {
				favorite-apps = [
					"firefox.desktop"
					"kitty.desktop"
					"spotify.desktop"
					"nautilus.desktop"
					"telegram-desktop.desktop"
					"webcord.desktop"
				];
				disable-user-extensions = false;
				enabled-extensions = [
					"blur-my-shell@aunetx"
					"bluetooth-quick-connect@bjarosze.gmail.com"
					"clipboard-indicator@tudmotu.com"
					"aztaskbar@aztaskbar.gitlab.com"
					"launch-new-instance@gnome-shell-extensions.gcampax.github.com"
					"quick-settings-tweaker@gnome-shell-extensions.gcampax.github.com"
					# "forge@gnome-shell-extensions.gcampax.github.com"
				];
			};
			"org/gnome/desktop/interface" = {
				color-scheme = "prefer-dark";
			};
			"org/gnome/desktop/screensaver" = {
				picture-uri = "file:///home/nixwall.png";
			};
			"org/gnome/desktop/background" = {
				picture-uri = "file:///home/c5514/nixwall.png";
				picture-uri-dark = "file:///home/c5514/nixwall.png";
				primary-color = "#3465a4";
			};
		};
	};
}

{pkgs, inputs, ...}:
{
	home.file.".mozilla/firefox/default/chrome/firefox-gnome-theme".source = inputs.firefox-gnome-theme;	
	programs.firefox = {
		enable = true;
		package = pkgs.firefox;
		policies = {
			DisableTelemetry = true;
			DisableFirefoxStudies = true;
			EnableTrackingProtection = {
				Value = true;
				Locked = true;
				Fingerprinting = true;
			};
			DisablePocket = true;
			DisableFirefoxAccounts = true;
			DisableAccounts = true;
		};
		profiles.default = {
			name = "Default";
			search = {
				force = true;
				default = "DuckDuckGo";
				order = [ "DuckDuckGo" "Google"];
			};
			bookmarks = [
				{
					name = "NixOS";
					url = "https://nixos.org/";
				}
				{
					name = "Nixpkgs";
					url = "https://search.nixos.org/packages?channel=unstable";
				}
				{
					name = "GitHub";
					url = "https://github.com/";
				}
				{
					name = "Home-manager";
					url = "https://nix-community.github.io/home-manager";
				}
				{
					name = "Wiki";
					url = "https://wiki.nixos.org/";
				}
			];
			extensions = with inputs.firefox-addons.packages."x86_64-linux";[
				ublock-origin
				darkreader
				sponsorblock
				youtube-shorts-block
				clearurls
				ghostery
			];
			settings = {
            	"extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
            	# For Firefox GNOME theme:
            	"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            	"browser.tabs.drawInTitlebar" = true;
            	"svg.context-properties.content.enabled" = true;
        	};
			userChrome = ''
				@import "firefox-gnome-theme/userChrome.css";
				@import "firefox-gnome-theme/theme/colors/dark.css"; 
			'';
			userContent = ''
				@import "firefox-gnome-theme/userContent.css";
			'';
		};
	};
}

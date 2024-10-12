{ config, lib, pkgs, inputs,... }:

{
	# Home Manager needs a bit of information about you and the paths it should
	# manage.
	home.username = "c5514";
	home.homeDirectory = "/home/c5514";
	home.stateVersion = "24.05"; # Please read the comment before changing.
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.allowUnfreePredicate = (_: true);
	home.packages = with pkgs; [
		ripgrep
		coreutils
		fd
		clang
		bun
		dart-sass
		swww
		gtk3
		hyprpicker
		evince
		webcord
		wineWowPackages.waylandFull
		megacmd
		libnotify
		lshw
		procps
		lm_sensors
		# kdePackages.xwaylandvideobridge
		blueberry
		gnome-bluetooth
		gnome-weather
		gnome-clocks
		gnome-calendar
		gnome-calculator
		gnome-disk-utility
		networkmanagerapplet
		(pkgs.inkscape-with-extensions.override {inkscapeExtensions = [ inkscape-extensions.textext ]; })
		github-desktop
		# pywal
		expat
		fzf
		wf-recorder
		inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
		inputs.matugen.packages.${system}.default
	# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
	];
	# Home Manager is pretty good at managing dotfiles. The primary way to manage
	# plain files is through 'home.file'.
	home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
	};

	# Home Manager can also manage your environment variables through
	# 'home.sessionVariables'. These will be explicitly sourced when using a
	# shell provided by Home Manager. If you don't want to manage your shell
	# through Home Manager then you have to manually source 'hm-session-vars.sh'
	# located at either
	#
	#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
	#
	# or
	#
	#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
	#
	# or
	#
	#  /etc/profiles/per-user/c5514/etc/profile.d/hm-session-vars.sh
	#
	home.sessionVariables = {
	# EDITOR = "emacs";
	};
	programs.git.enable = true;
	imports = [
		./home/ags.nix
		./home/dconf.nix
		./home/firefox.nix
		./home/fish.nix
		./home/hypr/hypridle.nix
		./home/hypr/hyprland.nix
		./home/hypr/hyprlock.nix
		./home/nixvim/nixvim.nix
		./home/kitty.nix
		# ./home/rofi.nix
		./home/spicetify.nix
		./home/starship.nix
		./home/theme.nix
		./home/tmux.nix
		./home/vscodium.nix
		# ./home/waypaper/waypaper.nix
		# ./home/wlogout/wlogout.nix
		./home/yazi.nix
		./home/zathura.nix
	];
	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}

{ config, lib, pkgs, inputs,... }:
{
	home.username = "c5514";
	home.homeDirectory = "/home/c5514";
	home.stateVersion = "24.05";
	nixpkgs.config.allowUnfree = true;
	nixpkgs.config.allowUnfreePredicate = (_: true);
	imports = [
		../../nixModules/home/HYPR/withAgs/ags.nix
		../../nixModules/home/HYPR/withAgs/hyprland.nix
		../../nixModules/home/HYPR/hypridle.nix
		../../nixModules/home/HYPR/hyprlock.nix
		../../nixModules/home/default.nix #Doesnt include hyprland configuration
	];
	home.sessionVariables = {
		EDITOR = "nvim";
		BROWSER = "firefox";
		TERMINAL = "kitty";
	};
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
		megacmd
		webkitgtk_6_0
		libnotify
		lshw
		procps
		lm_sensors
		blueberry
		gnome-bluetooth
		gnome-weather
		gnome-clocks
		gnome-calendar
		gnome-calculator
		gnome-disk-utility
		networkmanagerapplet
		libsForQt5.qt5.qtwayland
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
	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}

{ config, pkgs, inputs,... }:

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
		libnotify
		lshw
		procps
		lm_sensors
		blueberry
		gnome-bluetooth
		# gnome-control-center
		networkmanagerapplet
		# spotify #Comment to use spicetify
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
		./home/firefox.nix
		./home/fish.nix
		./home/hypr/hypridle.nix
		./home/hypr/hyprland.nix
		./home/hypr/hyprlock.nix
		./home/nvim.nix
		./home/kitty.nix
		./home/megasync.nix
		# ./home/rofi.nix
		./home/spicetify.nix
		./home/starship.nix
		./home/theme.nix
		./home/vscodium.nix
		# ./home/waypaper/waypaper.nix
		# ./home/wlogout/wlogout.nix
		./home/yazi.nix
		./home/zathura.nix
		# ./home/zsh.nix
	];
	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}

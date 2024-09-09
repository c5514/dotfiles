{ config, pkgs,ags,hyprland-contrib, ... }:

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
		ranger
		evince
		webcord
		libnotify
		blueberry
		gnome.gnome-bluetooth
		hyprland-contrib.packages.${pkgs.system}.grimblast
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
		./home/zsh.nix
		./home/theme.nix
		./home/nvim.nix
		./home/vscodium.nix
		./home/zathura.nix
		./home/ags.nix
		./home/wlogout.nix
		./home/hyprland.nix
		./home/hyprlock.nix
		./home/hypridle.nix
	];
	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}

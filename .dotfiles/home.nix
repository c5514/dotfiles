{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "c5514";
  home.homeDirectory = "/home/c5514";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = [
    pkgs.libsForQt5.okular
	pkgs.ripgrep
	pkgs.emacs29-pgtk
	pkgs.findutils
	pkgs.fd
	pkgs.clang
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
  programs.zsh = {
  	enable = true;
	autosuggestion = {
		enable = true;
		highlight = "fg=#6f6c5d";
	};
	history = {
        path = "$HOME/.histfile";
        save = 10000;
        size = 10000;
    };
  	shellAliases = {
    ll = "ls -l";
    ff = "fastfetch";
    tex = "cd ~/Documents/Vim/Tex/";
    nv = "nvim";
    ".." = "cd ..";
    c = "clear";
  	};
	oh-my-zsh = {
		enable = true;
		theme = "agnoster";
	};
  };
  	  # programs.bash.enable = true;
  # programs.bash.shellAliases = {
  #   ll = "ls -l";
  #   ff = "fastfetch";
  #   tex = "cd ~/Documents/Vim/Tex/";
  #   nv = "nvim";
  #   ".." = "cd ..";
  #   c = "clear";
  # };
  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Ice";
  gtk.cursorTheme.size = 24;
  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3-dark";
  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus";
  #Neovim configuration
programs.git.enable = true;
programs.neovim = 
let 
	toLua = str: "lua << EOF\n${str}\nEOF\n";
	toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{
	enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;
	vimdiffAlias = true;
	extraLuaConfig = ''${builtins.readFile ./nvim/options.lua}'';
	plugins = 
	let
	 nvim-treesitter-with-plugins = pkgs.vimPlugins.nvim-treesitter.withPlugins (treesitter-plugins:
	 with treesitter-plugins; [
		bash
		c 
		cpp
		json
		lua 
		nix 
		python
		rasi
		toml
		vim
		zig
	]);
	in 
	with pkgs.vimPlugins; [
		nvim-treesitter-with-plugins
		nui-nvim
		nvim-web-devicons
		plenary-nvim
		{
			plugin = nvim-lspconfig;
			config = toLuaFile ./nvim/configs/lsp.lua;
		}
		{
			plugin = nvim-treesitter-context;
			config = toLuaFile ./nvim/configs/treesitterContext.lua;
		}
		{
			plugin = nvim-autopairs;
			config = toLua "require(\"nvim-autopairs\").setup()";
		}
		{
			plugin = indent-blankline-nvim;
			config = toLua "require(\"ibl\").setup()";
		}
		{
			plugin = dashboard-nvim;
			config = toLuaFile ./nvim/configs/dashboard.lua;
		}
		{
			plugin = bufferline-nvim;
			config = toLua "require(\"bufferline\").setup{}";
		}
		{
			plugin = nvim-cmp;
			config = toLuaFile ./nvim/configs/cmp.lua;
		}
		cmp-nvim-lsp
		cmp_luasnip
		cmp-buffer
		cmp-path
		{
			plugin = vimtex;
			config = toLuaFile ./nvim/configs/vimtex.lua;
		}
		{
			plugin = comment-nvim;
			config = toLua "require(\"Comment\").setup()";
		}
		{
			plugin = lualine-nvim;
			config = toLuaFile ./nvim/configs/lualine.lua;
		}
		{
			plugin = todo-comments-nvim;
			config = toLuaFile ./nvim/configs/todoComments.lua;
		}
		{
			plugin = onedark-nvim;
			config = toLuaFile ./nvim/configs/onedark.lua;
		}
		{
			plugin = telescope-nvim;
			config = toLuaFile ./nvim/configs/telescope.lua;
		}
		which-key-nvim
		{
			plugin = neo-tree-nvim;
			config = toLuaFile ./nvim/configs/neotree.lua;
		}
		friendly-snippets
		{
			plugin = luasnip;
			config = toLuaFile ./nvim/configs/luasnip.lua;
		}
	];
	extraPackages = with pkgs; [
		# LSP 
		lua-language-server
		nixd
		texlab
		pyright
		# Tools 
		cmake
		fzf
		gcc
		gnumake
	];
};
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

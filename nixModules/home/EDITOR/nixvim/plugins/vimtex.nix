{pkgs,lib,config,...}:
{
	programs.nixvim = {
		highlightOverride = {
			Conceal.fg = "#d3d3d3";
		};
		plugins.vimtex = {
			enable = true;
			# xdotoolPackage = pkgs.xdotool;
			texlivePackage = pkgs.texliveFull;
			settings = {
				view_method = "zathura_simple";
				quickfix_enabled = true;
				quickfix_open_on_warning = false;
				quickfix_ignore_filters = [
					"Underfull"
					"Overfull"
					"specifier changed to"
					"Token not allowed in a PDF string"
				];
			};
		};
		keymaps = lib.mkIf config.programs.nixvim.plugins.vimtex.enable [
		# Change of math mode ds$ --> dsm, cs$ --> csm, ts$ --> tsm
		{
			mode = "n" ;
			key = "dsm";
			action = "<Plug>(vimtex-env-delete-math)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		{
			mode = "n";
			key = "csm";
			action = "<Plug>(vimtex-env-change-math)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		{
			mode = "n";
			key = "tsm";
			action = "<Plug>(vimtex-env-toggle-math)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		# Change of environment ]m --> ]e, ]M --> ]E, [m-->[e, [M --> [E
		{
			mode = [ "n" "x" "o"];
			key = "]e";
			action = "<Plug>(vimtex-]m)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		{
			mode = [ "n" "x" "o"];
			key = "]E";
			action = "<Plug>(vimtex-]M)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		{
			mode = [ "n" "x" "o"];
			key = "[e";
			action = "<Plug>(vimtex-[m)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		{
			mode = [ "n" "x" "o"];
			key = "[E";
			action = "<Plug>(vimtex-[M)";
			options = {
				silent = true;
				noremap = false;
				# desc = "dd";
			};
		}
		# Change of math mode ]n --> ]m, ]N --> ]M, [n-->[m, [N --> [M
		{
			mode = [ "n" "x" "o"];
			key = "]m";
			action = "<Plug>(vimtex-]n)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		{
			mode = [ "n" "x" "o"];
			key = "]M";
			action = "<Plug>(vimtex-]N)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		{
			mode = [ "n" "x" "o"];
			key = "[m";
			action = "<Plug>(vimtex-[n)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		{
			mode = [ "n" "x" "o"];
			key = "[M";
			action = "<Plug>(vimtex-[N)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		# Change of itemize/enumerate environment am --> ai, im --> ii
		{
			mode = [ "x" "o"];
			key = "ai";
			action = "<Plug>(vimtex-am)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		{
			mode = [ "x" "o"];
			key = "ii";
			action = "<Plug>(vimtex-im)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		# Change of math mode a$ --> am, i$ --> im
		{
			mode = [ "n" "x" "o"];
			key = "am";
			action = "<Plug>(vimtex-a$)";
			options = {
				silent = true;
				noremap = false;
			};
		}
		{
			mode = [ "n" "x" "o"];
			key = "im";
			action = "<Plug>(vimtex-i$)";
			options = {
				silent = true;
				noremap = false;
			};
		}
	];
	};
}

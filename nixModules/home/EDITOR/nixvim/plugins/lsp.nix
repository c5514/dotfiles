{pkgs,...}:
{
	programs.nixvim.plugins.trouble.enable = true;
	# programs.nixvim.plugins.lsp-format.enable = true;
	programs.nixvim.plugins.lsp = {
		enable = true;
		servers = {
			html.enable = true;
			bashls.enable = true;
			clangd.enable = true;
			lua_ls.enable = true;
			marksman.enable = true;	
			# nil_ls.enable = true;
			nixd.enable = true;
			pyright.enable = true;
			texlab.enable = true;
		};
		keymaps = {
			silent = true;
			lspBuf = {	
				gd = {
					action = "definition";
					desc = "Goto Definition";
				};
				gr = {
					action = "references";
					desc = "Goto References";
				};
				gD = {
					action = "declaration";
					desc = "Goto Declaration";
				};
				gI = {
					action = "implementation";
					desc = "Goto Implementation";
				};
				gT = {
					action = "type_definition";
					desc = "Type Definition";
				};
				K = {
					action = "hover";
					desc = "Hover";
				};
				"<leader>cw" = {
					action = "workspace_symbol";
					desc = "Workspace symbol";
				};
				"<leader>cr" = {
					action = "rename";
					desc = "Rename";
				};
			};
			diagnostic = {
				"<leader>cd" = {
					action = "open_float";
					desc = "Line Diagnostics";
				};
				"[d" = {
					action = "goto_next";
					desc = "Next Diagnostic";
				};
				"]d" = {
					action = "goto_prev";
					desc = "Previous Diagnostic";
				};
			};
		};
	};
}

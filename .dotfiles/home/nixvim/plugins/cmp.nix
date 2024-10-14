{pkgs, ...}:
{

	programs.nixvim.plugins = {
		# copilot-cmp.enable = true;
		# copilot-lua = {
  #   		enable = true;
  #   		suggestion.enabled = false;
  #   		panel.enabled = false;
		# };
		cmp-emoji.enable = true;
		cmp-nvim-lsp.enable = true;
		cmp-buffer.enable = true;
		cmp-path.enable = true;
		cmp_luasnip.enable = true;
		cmp-cmdline.enable = true;
		cmp = {
			enable = true;
			settings = {
				autoEnableSources = true;
				experimental.ghost_text = true;
				performance = {
					debounce = 60;
					fetchingTimeout = 200;
					maxViewEntries = 30;
				};
				snippet = {
					expand = ''
    					function(args)
    						require'luasnip'.lsp_expand(args.body)
    					end
					'';
				};
				formatting = {
					fields = [ "abbr" "kind" "menu"];
					expandable_indicator = true;
					format = ''
						function(_, item)
                		local icons = {
            			Namespace = "󰌗",
                		Text = "󰉿",
                		Method = "󰆧",
                		Function = "󰆧",
            			Constructor = "",
                		Field = "󰜢",
            			Variable = "󰀫",
                		Class = "󰠱",
        				Interface = "",
            			Module = "",
            			Property = "󰜢",
                		Unit = "󰑭",
            			Value = "󰎠",
        				Enum = "",
            			Keyword = "󰌋",
            			Snippet = "",
            			Color = "󰏘",
            			File = "󰈚",
            			Reference = "󰈇",
        				Folder = "󰉋",
        				EnumMember = "",
            			Constant = "󰏿",
        				Struct = "󰙅",
            			Event = "",
            			Operator = "󰆕",
            			TypeParameter = "󰊄",
            			Table = "",
        				Object = "󰅩",
        				Tag = "",
            			Array = "[]",
            			Boolean = "",
            			Number = "",
        				Null = "󰟢",
        				String = "󰉿",
        				Calendar = "",
        				Watch = "󰥔",
        				Package = "",
        				Copilot = "",
        				Codeium = "",
        				TabNine = "",
        			}
        			local icon = icons[item.kind] or ""
        				item.kind = string.format("%s %s", icon, item.kind or "")
    				return item
            		end
					'';
				};
				sources = [
					{	name = "nvim_lsp";	}
					{
						name = "luasnip";
						keywordLength = 3;
						option.show_autosnippets = true;
					}
					{	name = "orgmode";  }
					{
						name = "buffer";
						option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
						keywordLength = 3;
					}
					# {	name = "copilot";	}
					{	name = "emoji";	}
					{
						name = "path";
						keywordLength = 3;
					}
				];
				window = {
					completion.border = "rounded";
					documentation.border = "rounded";
				};
				mapping = {
					"<A-k>" = "cmp.mapping.select_prev_item()";
					"<A-j>" = "cmp.mapping.select_next_item()";
    				"<A-b>" = "cmp.mapping(cmp.mapping.scroll_docs(-1),{'i','c'})";
    				"<A-f>" = "cmp.mapping(cmp.mapping.scroll_docs(1),{'i','c'})";
    				"<A-Space>" = "cmp.mapping(cmp.mapping.complete(),{'i','c'})";
    				"<A-e>" = "cmp.mapping{
									i = cmp.mapping.abort(),
									c = cmp.mapping.close(),
								}";
    				"<CR>" = "cmp.mapping.confirm({ select = true })";
    				"<S-Tab>" = "cmp.mapping(function(fallback)
									if cmp.visible() then
										cmp.select_prev_item()
									elseif require('luasnip').locally_jumpable(-1) then
										require('luasnip').jump(-1)
									else
										fallback()
									end
								end, {'i','s'})";
					"<Tab>" = "cmp.mapping(function(fallback)
									if cmp.visible() then
										cmp.select_next_item()
									elseif require('luasnip').locally_jumpable(1) then
										require('luasnip').jump(1)
									else
										fallback()
									end
								end, {'i','s'})";
				};
			};
		};
	};
}

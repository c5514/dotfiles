require("lazy").setup({
	{
		"navarasu/onedark.nvim",
		config = function()
			require("plugins.onedark")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						visible = true,
					},
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"windwp/nvim-autopairs",
		enabled = not vim.env.NVIM_TEXTEXT,
		event = "InsertEnter",
		config = function()
			require("plugins/autopairs")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		config = function()
			require("plugins/telescope")
		end,
	},
	-- {
	--   "hrsh7th/nvim-cmp",
	--   dependencies = {
	--     "hrsh7th/cmp-buffer",
	--     "saadparwaiz1/cmp_luasnip",
	--     "hrsh7th/cmp-path",
	--     "hrsh7th/cmp-nvim-lsp",
	--     "f3fora/cmp-spell",
	--     "micangl/cmp-vimtex",
	--     -- "hrsh7th/cmp-cmdline"
	--   },
	--   config = function()
	--     require "plugins/cmp"
	--   end,
	-- },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("plugins/luasnip")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"texlab",
				"pyright",
				"rust_analyzer",
				-- "codelldb",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins/lsp")
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		config = function()
			require("plugins/lspsaga")
		end,
	},
	{
		"lervag/vimtex",
		config = function()
			require("plugins/vimtex")
		end,
	},
	{
		"rpapallas/illustrate.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		config = function()
			require("plugins/illustrate")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		main = "ibl",
		config = function()
			require("ibl").setup()
		end,
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "echasnovski/mini.icons" },
		enabled = not vim.env.NVIM_TEXTEXT,
		-- dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("plugins/alpha")
		end,
	},
	{
		"folke/todo-comments.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins/todoComments")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		enabled = not vim.env.NVIM_TEXTEXT,
		config = function()
			require("plugins/treesitter")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		enabled = not vim.env.NVIM_TEXTEXT,
		config = function()
			require("plugins/treesitterContext")
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
	},
	-- {
	--   "folke/noice.nvim",
	--   event = "VeryLazy",
	--   dependencies = {
	--     "MunifTanjim/nui.nvim",
	--     -- "rcarriga/nvim-notify",
	--   },
	--   config = function()
	--     require "plugins/noice"
	--   end
	-- },
	-- {
	--   "rcarriga/nvim-notify",
	--   config = function()
	--     require("notify").setup({
	--       background_colour = "#000000",
	--     })
	--   end
	-- },
	{
		"trunk-io/neovim-trunk",
		enabled = not vim.env.NVIM_TEXTEXT,
		lazy = false,
		main = "trunk",
	},
	{
		"echasnovski/mini.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		version = "*",
		config = function()
			require("plugins/mini")
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"mrjones2014/smart-splits.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		config = function()
			require("plugins/splits")
		end,
	},
	{
		"stevearc/conform.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		config = function()
			require("plugins/conform")
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		lazy = true,
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"f-person/git-blame.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
		event = "VeryLazy",
		config = function()
			require("plugins/gitblame")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		enabled = not vim.env.NVIM_TEXTEXT,
	},
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		enabled = not vim.env.NVIM_TEXTEXT,
	},
	{
		"mbbill/undotree",
		enabled = not vim.env.NVIM_TEXTEXT,
		config = function()
			require("plugins/undotree")
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"saghen/blink.cmp",
		version = "1.3.1",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"ribru17/blink-cmp-spell",
			-- "f3fora/cmp-spell",
			"micangl/cmp-vimtex",
		},
		config = function()
			require("plugins/blink")
		end,
	},
	{
		"saghen/blink.compat",
		version = "2.5.0",
		lazy = true,
		opts = {},
	},
})

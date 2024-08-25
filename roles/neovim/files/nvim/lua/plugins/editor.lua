return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				always_show_bufferline = false,
			},
		},
	},

	{ "echasnovski/mini.statusline", version = "*", opts = {} },

	-- Treesitter, for code highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "bash", "go", "lua", "markdown", "vim", "vimdoc", "terraform" },
			modules = {},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			sync_install = false,
			ignore_install = { "" },
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},

		cmd = "Neotree",
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({
						toggle = true,
						reveal = true,
					})
				end,
				desc = "Explorer NeoTree",
			},
		},
	},

	-- Telescope, an extensible fuzzy finder over lists
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		keys = {
			{
				"<leader>fb",
				"<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
				desc = "Show all open buffers",
			},
			{
				"<leader>ff",
				"<cmd>Telescope find_files <cr>",
				desc = "Find Files (root dir)",
			},
			{
				"<leader>fw",
				"<cmd>Telescope grep_string <cr>",
				desc = "Find word in cwd (root dir)",
			},

			{
				"<leader>tl",
				"<cmd>Telescope <cr>",
				desc = "Launch Telescope",
			},
			{
				"<leader>lg",
				"<cmd>Telescope live_grep <cr>",
				desc = "Telescope live_grep",
			},
		},
	},

	-- Useful status updates for LSP.
	{
		"j-hui/fidget.nvim",
		opts = {},
	},

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}

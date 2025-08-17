return {

	{
		"echasnovski/mini.statusline",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},

	-- Treesitter, for code highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		event = "VeryLazy",
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
		"folke/snacks.nvim",
		event = "VimEnter",
		opts = {
			picker = {},
			explorer = {},
		},
	},

	-- Useful status updates for LSP.
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			current_line_blame = true,
		},
	},
}

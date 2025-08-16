return {
	{
		"mfussenegger/nvim-lint",
		-- event = "BufRead",
		event = "VeryLazy",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		event = "VeryLazy",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
		},
	},

	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				terraform = { "terraform_fmt" },
				python = { "black" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
}

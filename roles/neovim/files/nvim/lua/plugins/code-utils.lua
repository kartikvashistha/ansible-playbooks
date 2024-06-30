return {
	{
		"mfussenegger/nvim-lint",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
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
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
		},
	},

	{
		"stevearc/conform.nvim",
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

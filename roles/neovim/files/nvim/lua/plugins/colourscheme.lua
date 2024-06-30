return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
	},

	{
		"sainnhe/sonokai",
		lazy = false,
		-- priority = 1000,
		init = function() -- init function runs before the plugin is loaded
			vim.g.sonokai_style = "maia"
			-- vim.g.sonokai_better_performance = "1"
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
	},
}

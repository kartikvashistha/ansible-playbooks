return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
	},

	{
		"sainnhe/sonokai",
		lazy = true,
		init = function() -- init function runs before the plugin is loaded
			vim.g.sonokai_style = "maia"
		end,
	},
}

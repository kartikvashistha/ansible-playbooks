-- Neotree
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
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
}

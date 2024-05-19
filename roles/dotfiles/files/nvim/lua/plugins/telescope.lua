-- Telescope, an extensible fuzzy finder over lists
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
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
	},
}

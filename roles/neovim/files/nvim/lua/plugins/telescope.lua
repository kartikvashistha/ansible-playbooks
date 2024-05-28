-- Telescope, an extensible fuzzy finder over lists
return {
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
}

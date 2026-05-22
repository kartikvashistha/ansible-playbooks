vim.pack.add({
	"https://github.com/mfussenegger/nvim-lint",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/numToStr/Comment.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/folke/todo-comments.nvim", -- Highlight todo, notes, etc in comments
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/stevearc/conform.nvim",
})

require("ibl").setup()

require("Comment").setup()

require("nvim-autopairs").setup()

require("todo-comments").setup({
	signs = false,
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		terraform = { "terraform_fmt" },
		python = { "black" },
	},
	format_on_save = { timeout_ms = 500, lsp_fallback = true },
})

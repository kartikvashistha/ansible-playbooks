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
		branch = "main",
		lazy = false,
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"dockerfile",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"hcl",
				"helm",
				"html",
				"ini",
				"java",
				"javascript",
				"json",
				"kotlin",
				"lua",
				"luadoc",
				"make",
				"markdown",
				"markdown",
				"python",
				"rust",
				"terraform",
				"toml",
				"vim",
				"vimdoc",
				"yaml",
			},
		},
		config = function(_, opts)
			local TS = require("nvim-treesitter")
			TS.install(opts.ensure_installed)

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter.setup", {}),
				callback = function(args)
					local buf = args.buf
					local filetype = args.match

					-- you need some mechanism to avoid running on buffers that do not
					-- correspond to a language (like oil.nvim buffers), this implementation
					-- checks if a parser exists for the current language
					local language = vim.treesitter.language.get_lang(filetype) or filetype
					if not vim.treesitter.language.add(language) then
						return
					end

					-- replicate `fold = { enable = true }`
					-- vim.wo.foldmethod = "expr"
					-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

					-- replicate `highlight = { enable = true }`
					vim.treesitter.start(buf, language)

					-- replicate `indent = { enable = true }`
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

					-- `incremental_selection = { enable = true }` cannot be easily replicated
				end,
			})
		end,
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

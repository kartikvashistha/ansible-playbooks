vim.pack.add({
	"https://github.com/echasnovski/mini.statusline",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
})

require("mini.statusline").setup()

require("snacks").setup({
	picker = {},
	explorer = {},
})

require("fidget").setup()

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
	current_line_blame = true,
})

-- require("nvim-treesitter").setup({
-- 	ensure_installed = {
-- 	},
-- })

local TS = require("nvim-treesitter")
TS.install({
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
})

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
-- end,

--
-- -- Treesitter, for code highlighting
-- {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	build = ":TSUpdate",
-- 	branch = "main",
-- 	lazy = false,
-- 	event = "VeryLazy",
-- 	config = function(_, opts)
-- 		local TS = require("nvim-treesitter")
-- 		TS.install(opts.ensure_installed)
--
-- 		vim.api.nvim_create_autocmd("FileType", {
-- 			group = vim.api.nvim_create_augroup("treesitter.setup", {}),
-- 			callback = function(args)
-- 				local buf = args.buf
-- 				local filetype = args.match
--
-- 				-- you need some mechanism to avoid running on buffers that do not
-- 				-- correspond to a language (like oil.nvim buffers), this implementation
-- 				-- checks if a parser exists for the current language
-- 				local language = vim.treesitter.language.get_lang(filetype) or filetype
-- 				if not vim.treesitter.language.add(language) then
-- 					return
-- 				end
--
-- 				-- replicate `fold = { enable = true }`
-- 				-- vim.wo.foldmethod = "expr"
-- 				-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--
-- 				-- replicate `highlight = { enable = true }`
-- 				vim.treesitter.start(buf, language)
--
-- 				-- replicate `indent = { enable = true }`
-- 				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
--
-- 				-- `incremental_selection = { enable = true }` cannot be easily replicated
-- 			end,
-- 		})
-- 	end,
-- },

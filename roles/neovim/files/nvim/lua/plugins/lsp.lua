-- INFO: This file contains information on how to install, setup & enable language servers and their configurations.
-- Most language servers can be installed via Mason and have a sensible set of default configuration available to us via nvim-lspconfig in order to start using them.
-- When an LSP configuration needs to either be overriden, or setup from scratch (i.e., when not available on nvim-lspconfig), then the rtp/lsp/<language_server_name.lua> files are used to perform that.
-- Once the desired language server and their config overrides are in place, they are enabled via `vim.lsp.enable`.

-- The `tools` table consists of two sub-tables: `mason` and `others`.
-- The `mason` sub table is a collection of lists, which contain all the different kind of packages we want to install via Mason.
-- The `others` sub table is similar, but has certain caveats - for eg: it consists of a language servers list, that tracks language servers installed *outside* of Mason (i.e., via local system package manager, etc.).
local tools = {
	mason = {
		language_servers = {
			"ansiblels",
			"clangd",
			"gopls",
			"lua_ls",
			"pyright",
			"rust_analyzer",
			"terraformls",
		},
		linters = { "ruff" },
		formatters = { "stylua", "gofumpt", "ruff" },
	},
	others = {
		language_servers = {},
	},
}

local allMasonPkgs =
	vim.iter({ tools.mason.language_servers, tools.mason.linters, tools.mason.formatters }):flatten():totable()

-- INFO: Enable all language servers as defined in the tools table
vim.lsp.enable(vim.tbl_deep_extend("force", tools.mason.language_servers, tools.others.language_servers))

return {
	{
		"whoissethdaniel/mason-tool-installer.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {}, events = "VeryLazy" },
		},
		events = "VeryLazy",
		opts = { ensure_installed = allMasonPkgs },
	},

	-- INFO:This plugin bridges the gap between installed LSP's via Mason and their configuration as provided by nvim-lspconfig.
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		events = "VeryLazy",
		lazy = true,
		opts = {
			automatic_enable = false, -- NOTE: From Mason 2.0 onwards, this option can automatically enable all Mason installed servers via vim.lsp.enable, which can cause a slightly worse startup time.
		},
	},
}

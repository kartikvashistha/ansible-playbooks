-- INFO:List of formatters to install via Mason
local formatters = { "stylua", "gofumpt", "ruff" }
-- INFO:List of linters to install via Mason
local linters = { "ansible-lint" }
-- INFO:List of language servers to install & setup via Mason.
-- NOTE: These should be nvim-lspconfig server names that are *also* supported by Mason for automatic server setup.
-- Any and all server settings are overriden via the lsp/ folder.
local language_servers = {
	"ansiblels",
	"clangd",
	"gopls",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"terraformls",
} -- WARN: All non-mason language servers need to be setup manually and differently as shown above.

local allMasonPkgs = vim.iter({ language_servers, linters, formatters }):flatten():totable()

return {
	{
		"whoissethdaniel/mason-tool-installer.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
		},
		opts = { ensure_installed = allMasonPkgs },
	},

	-- INFO:This plugin bridges the gap between installed LSP's via Mason and their configuration as provided by nvim-lspconfig.
	-- From Mason 2.0 and nvim 0.11 onwards, this plugin will automatically enable all installed servers via vim.lsp.enable
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
			},
		},
		opts = {},
	},
}

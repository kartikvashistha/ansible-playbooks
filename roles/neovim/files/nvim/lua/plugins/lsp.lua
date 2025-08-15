#INFO: lsp_servers is a table containing a configuration for both mason and non-mason installed language servers with the following keys:
#####  (1) `name`: Name of the language server to either install via mason, or to refer elsewhere;
#####  (2) `alias`: This is the `nvim-lspconfig` alias for a language server's configuration. This key is primarily used for enabling a language server via `vim.lsp.enable`;
local lsp_servers = {
	mason = {
		{ name = "ansible-language-server", alias = "ansiblels" },
		{ name = "bash-language-server", alias = "bashls" },
		{ name = "clangd", alias = "clangd" },
		{ name = "gopls", alias = "gopls" },
		{ name = "lua-language-server", alias = "lua_ls" },
		{ name = "pyright", alias = "pyright" },
		{ name = "rust-analyzer", alias = "rust_analyzer" },
		{ name = "terraform-ls", alias = "terraformls" },
	},
	system = {},
}

local mason = {
	language_servers = function()
		local servers = {}
		for _, ls in pairs(lsp_servers.mason) do
			table.insert(servers, ls.name)
		end
		return servers
	end,
	linters = { "yamllint" },
	formatters = { "stylua", "gofumpt", "ruff" },
}

local allMasonPkgs = vim.iter({ mason.language_servers(), mason.formatters, mason.linters }):flatten():totable()

local servers_to_enable = function()
	local keys = {}

	for _, value in pairs(lsp_servers.mason) do
		table.insert(keys, value.alias)
	end

	for _, value in pairs(lsp_servers.system) do
		table.insert(keys, value.alias)
	end

	return keys
end

-- INFO: Enable all language servers as defined in the tools table
vim.lsp.enable(servers_to_enable())

return {
	{
		"whoissethdaniel/mason-tool-installer.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {}, events = "VeryLazy" },
			{ "neovim/nvim-lspconfig", events = "VeryLazy" },
		},
		events = "VeryLazy",
		opts = { ensure_installed = allMasonPkgs },
	},
}

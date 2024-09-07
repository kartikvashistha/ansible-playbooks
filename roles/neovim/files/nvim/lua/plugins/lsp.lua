local M = require("configs.mason")
local pkgs = M.mason_pkgs() -- List of pkgs (like language servers, linters and formatters) we want Mason to install
local lspconfig = M.lsp_configs() -- Table of lsp configurations for various language servers that we want to pass to our desired language servers.

return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
		},
		opts = { ensure_installed = pkgs },
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{
				"neovim/nvim-lspconfig",
			},
		},
		config = function()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local capabilities = vim.lsp.protocol.make_client_capabilities()
						capabilities =
							vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
						local server = lspconfig[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}

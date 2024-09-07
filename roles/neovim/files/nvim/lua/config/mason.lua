local M = {}

local formatters = { "stylua", "gofumpt", "ruff" }

local linters = { "ansible-lint" }

-- LSP configs can be found here: https://github.com/neovim/nvim-lspconfig
local language_server_configs = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = {
						"${3rd}/luv/library",
						unpack(vim.api.nvim_get_runtime_file("", true)),
					},
				},
				completion = {
					callsnippet = "Replace",
				},
			},
		},
	},
	clangd = {},
	gopls = {},
	rust_analyzer = {},
	pyright = {},
	terraformls = {},
	ansiblels = {},
}

local language_servers = vim.tbl_keys(language_server_configs)
local pkgs = vim.tbl_deep_extend("force", language_servers, { linters, formatters })

function M.lsp_configs()
	return language_server_configs
end

function M.mason_pkgs()
	return pkgs
end

return M

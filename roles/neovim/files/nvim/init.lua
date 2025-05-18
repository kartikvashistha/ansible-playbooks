-- Set leader key
vim.g.mapleader = " "
vim.cmd("set termguicolors")

-- Enable vim options
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.timeoutlen = 300
vim.opt.hlsearch = true
-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- bootstrap lazy.nvim
require("configs.lazy")

-- bootstrap additional configs
require("configs.keymaps")
require("configs.ansible")

-- Set colourscheme
vim.cmd([[colorscheme tokyonight-night]])

-- Execute the following vim script commands
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
-- capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())
--
-- vim.lsp.config("*", {
-- 	capabilities = capabilities,
-- 	flags = {
-- 		debounce_text_changes = 500,
-- 	},
-- })

vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_text = true,
	underline = { severity = vim.diagnostic.severity.ERROR },
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("custom-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

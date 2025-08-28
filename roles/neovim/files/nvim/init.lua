-- Set leader key
vim.g.mapleader = " "
vim.cmd("set termguicolors")

-- Enable vim options
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.timeoutlen = 300
vim.o.hlsearch = true
vim.o.winborder = "rounded"
-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- bootstrap additional configs
require("configs.lazy")
require("keymaps")
require("configs.ansible")

-- Set colourscheme
vim.cmd([[colorscheme tokyonight-night]])

-- Execute the following vim script commands
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

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

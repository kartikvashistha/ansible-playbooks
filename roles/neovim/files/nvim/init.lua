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

-- Load all files under the lua/plugins dir automatically
local function require_plugins(dir, prefix)
	local handle = vim.loop.fs_scandir(dir)
	if not handle then
		return
	end

	while true do
		local name, type = vim.loop.fs_scandir_next(handle)
		if not name then
			break
		end

		local path = dir .. "/" .. name

		if type == "directory" then
			require_plugins(path, prefix .. "." .. name)
		elseif type == "file" and name:match("%.lua$") then
			local module = prefix .. "." .. name:gsub("%.lua$", "")
			require(module)
		end
	end
end

local config = vim.fn.stdpath("config")
require_plugins(config .. "/lua/plugins", "plugins")

require("keymaps")
require("configs.ansible")

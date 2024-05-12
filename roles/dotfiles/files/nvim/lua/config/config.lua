-- Set colourscheme
vim.cmd([[colorscheme sonokai]])

-- Enable vim options
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.timeoutlen = 300
vim.opt.hlsearch = true

-- Execute the following vim script commands
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Navigate vim panes better
-- vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
-- vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
-- vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
-- vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

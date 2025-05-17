local Snacks = require("snacks")

local map = function(keys, func, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func, { desc = "" .. desc })
end

--  See `:help wincmd` for a list of all window commands
map("<C-h>", "<C-w><C-h>", "Move focus to the left window")
map("<C-l>", "<C-w><C-l>", "Move focus to the right window")
map("<C-j>", "<C-w><C-j>", "Move focus to the lower window")
map("<C-k>", "<C-w><C-k>", "Move focus to the upper window")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map("<Esc>", "<cmd>nohlsearch<CR>", "Clear highlights on search when pressing <Esc>")

-- LSP mappings that are accessible only when an LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		map("<leader>ds", Snacks.picker.lsp_symbols, "Document Symbols")
		map("<leader>D", Snacks.picker.lsp_type_definitions, "Type Definition")
		map("<leader>sd", Snacks.picker.diagnostics, "Show Diagnostics")
		map("<leader>sD", function()
			Snacks.picker.diagnostics_buffer()
		end, "Show Diagnostics in current buffer")

		if client:supports_method("textDocument/implementation") then
			map("gI", function()
				Snacks.picker.lsp_implementations()
			end, "Go to implementation")
		end
	end,
})

map("<leader>e", function()
	Snacks.explorer()
end, "Show File Explorer")

map("<leader>ff", function()
	Snacks.picker.files()
end, "Find Files")

map("<leader>fb", function()
	Snacks.picker.buffers()
end, "Show existing buffers")

map("<leader><leader>", function()
	Snacks.picker.grep()
end, "Search by Grep")

map("<leader>sh", function()
	Snacks.picker.help()
end, "Show help pages")

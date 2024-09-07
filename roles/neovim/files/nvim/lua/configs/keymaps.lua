local builtin = require("telescope.builtin")

local map = function(keys, func, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func, { desc = "" .. desc })
end

-- Telescope mappings
-- See `:help telescope.builtin`
map("<leader>sh", builtin.help_tags, "[S]earch [H]elp")
map("<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
map("<leader>ff", builtin.find_files, "[F]ind [F]iles")
map("<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
map("<leader>fw", builtin.grep_string, "[F]ind current [W]ord")
map("<leader><leader>", builtin.live_grep, "[S]earch by [G]rep")
map("<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
map("<leader>sr", builtin.resume, "[S]earch [R]esume")
map("<leader>s.", builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
map("<leader>fb", builtin.buffers, "[F]ind existing buffers")
map("<leader>tl", builtin.builtin, "Launch Telescope")

--  See `:help wincmd` for a list of all window commands
map("<C-h>", "<C-w><C-h>", "Move focus to the left window")
map("<C-l>", "<C-w><C-l>", "Move focus to the right window")
map("<C-j>", "<C-w><C-j>", "Move focus to the lower window")
map("<C-k>", "<C-w><C-k>", "Move focus to the upper window")

-- Neotree (i.e., file explorer) mappings
map("<leader>e", function()
	require("neo-tree.command").execute({
		toggle = true,
		reveal = true,
	})
end, "Explorer NeoTree")

-- LSP mappings
-- Jump to the definition of the word under your cursor. This is where a variable was first declared, or where a function is defined, etc. To jump back, press <C-t>.
map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")

-- Find references for the word under your cursor.
map("gr", builtin.lsp_references, "[G]oto [R]eferences")

-- Jump to the implementation of the word under your cursor. Useful when your language has ways of declaring types without an actual implementation.
map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")

-- Jump to the type of the word under your cursor. Useful when you're not sure what type a variable is and you want to see the definition of its *type*, not where it was *defined*.
map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")

-- Fuzzy find all the symbols in your current document. Symbols are things like variables, functions, types, etc.
map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")

-- Fuzzy find all the symbols in your current workspace.Similar to document symbols, except searches over your entire project.
map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

-- Rename the variable under your cursor. Most Language Servers support renaming across files, etc.
map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

-- Execute a code action, usually your cursor needs to be on top of an error or a suggestion from your LSP for this to activate.
map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

-- This is not Goto Definition, this is Goto Declaration. For example, in C this would take you to the header.
map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

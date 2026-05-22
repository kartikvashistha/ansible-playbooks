vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
})

require("blink.cmp").setup({
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = { preset = "default" },
	appearance = {

		nerd_font_variant = "mono",
	},

	-- (Default) Only show the documentation popup when manually triggered
	completion = { documentation = { auto_show = true, auto_show_delay_ms = 300 } },

	sources = {
		default = { "lsp", "path" },
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
})

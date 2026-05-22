vim.pack.add({
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/sainnhe/sonokai",
	"https://github.com/ellisonleao/gruvbox.nvim",
})

local theme = "sonokai" -- set desired theme value here
local colourscheme = function()
	if theme == "sonokai" then
		vim.g.sonokai_style = "maia"
	end

	-- if theme ==

	return theme
end

vim.cmd.colorscheme(colourscheme())

if vim.filetype then
	vim.filetype.add({
		pattern = {
			[".*/playbooks/.*%.yml"] = "yaml.ansible",
			[".*/playbooks/.*%.yaml"] = "yaml.ansible",
			[".*/roles/.*/tasks/.*%.yml"] = "yaml.ansible",
			[".*/roles/.*/tasks/.*%.yaml"] = "yaml.ansible",
			[".*/roles/.*/handlers/.*%.yml"] = "yaml.ansible",
			[".*/roles/.*/handlers/.*%.yaml"] = "yaml.ansible",
			[".*/roles/.*/defaults/.*%.yaml"] = "yaml.ansible",
			[".*/roles/.*/vars/.*%.yaml"] = "yaml.ansible",
			[".*/roles/.*/meta/.*%.yaml"] = "yaml.ansible",
			[".*/roles/.*/defaults/.*%.yml"] = "yaml.ansible",
			[".*/roles/.*/vars/.*%.yml"] = "yaml.ansible",
			[".*/roles/.*/meta/.*%.yml"] = "yaml.ansible",
		},
	})
else
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = {
			"*/playbooks/*.yml",
			"*/playbooks/*.yaml",
			"*/roles/*/tasks/*.yml",
			"*/roles/*/tasks/*.yaml",
			"*/roles/*/handlers/*.yml",
			"*/roles/*/vars/*.yaml",
			"*/roles/*/meta/*.yaml",
			"*/roles/*/defaults/*.yaml",
			"*/roles/*/vars/*.yml",
			"*/roles/*/meta/*.yml",
			"*/roles/*/defaults/*.yml",
		},
		callback = function()
			vim.bo.filetype = "yaml.ansible"
		end,
	})
end

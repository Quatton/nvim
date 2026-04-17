vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- or "■", "▎", ""
		spacing = 4,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})

vim.opt.loadplugins = true

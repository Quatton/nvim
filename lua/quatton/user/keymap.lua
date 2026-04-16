vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspKeymaps", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		local map = vim.keymap.set

		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "gD", vim.lsp.buf.declaration, opts)
		map("n", "gr", vim.lsp.buf.references, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		map("n", "K", vim.lsp.buf.hover, opts)

		map("n", "<leader>rn", vim.lsp.buf.rename, opts)
		map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		map("n", "<leader>e", vim.diagnostic.open_float, opts)
		map("n", "[d", vim.diagnostic.goto_prev, opts)
		map("n", "]d", vim.diagnostic.goto_next, opts)
	end,
})

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format buffer" })

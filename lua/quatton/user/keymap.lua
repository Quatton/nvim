vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspKeymaps", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		local fzf = require("fzf-lua")
		-- Use fzf-lua for navigation/searching
		vim.keymap.set("n", "gd", fzf.lsp_definitions, opts)
		vim.keymap.set("n", "gr", fzf.lsp_references, opts)
		vim.keymap.set("n", "gi", fzf.lsp_implementations, opts)
		vim.keymap.set("n", "<leader>ca", fzf.lsp_code_actions, opts)
		vim.keymap.set("n", "<leader>sd", fzf.diagnostics_document, opts)

		-- Keep standard LSP for direct interactions
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		-- Keep diagnostic navigation
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	end,
})

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "Format buffer" })

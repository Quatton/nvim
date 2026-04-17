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

-- Save in Normal mode
vim.keymap.set("n", "<D-s>", ":update<CR>", { noremap = true, silent = true })
-- Save in Insert mode
vim.keymap.set("i", "<D-s>", "<C-o>:update<CR>", { noremap = true, silent = true })
-- Save in Visual mode
vim.keymap.set("v", "<D-s>", "<C-c>:update<CR>gv", { noremap = true, silent = true })

-- Clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Undo with Cmd+Z (<D-z>) in any mode
vim.keymap.set("n", "<D-z>", "u", { noremap = true, silent = true })
vim.keymap.set("i", "<D-z>", "<C-o>u", { noremap = true, silent = true })
vim.keymap.set("v", "<D-z>", "<C-c>u", { noremap = true, silent = true })

-- Redo with Cmd+Shift+Z (<D-S-z>) in any mode
vim.keymap.set("n", "<D-S-z>", "<C-r>", { noremap = true, silent = true })
vim.keymap.set("i", "<D-S-z>", "<C-o><C-r>", { noremap = true, silent = true })
vim.keymap.set("v", "<D-S-z>", "<C-c><C-r>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostics under cursor" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics to location list" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Find Files (Root Dir)" },
			{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files (Root Dir)" },
			{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
			-- Search/Grep
			{ "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Grep (Root Dir)" },
			{ "<leader>sw", "<cmd>FzfLua grep_cword<cr>", desc = "Visual selection or word" },
			{ "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer" },
			-- Buffer/Git
			{ "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
			{ "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Status" },
			-- LSP
			{ "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Goto Definition" },
			{ "gr", "<cmd>FzfLua lsp_references<cr>", desc = "References" },
			{ "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document Symbols" },
		},
		---@module "fzf-lua"
		---@type fzf-lua.Config|{}
		---@diagnostic disable: missing-fields
		opts = {},
		---@diagnostic enable: missing-fields
	},
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			delay = 300,
		},
	},
}

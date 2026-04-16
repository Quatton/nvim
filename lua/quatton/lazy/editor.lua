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
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto", -- Automatically matches your colorscheme
				},
			})
		end,
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
	{
		"datsfilipe/vesper.nvim",
		lazy = false, -- Load immediately to avoid flash of default colors
		priority = 1000, -- Load this before other plugins
		config = function()
			require("vesper").setup({
				transparent = true, -- Boolean: Sets the background to transparent
				italics = {
					comments = true, -- Boolean: Italicizes comments
					keywords = false, -- Boolean: Italicizes keywords
					functions = false, -- Boolean: Italicizes functions
					strings = false, -- Boolean: Italicizes strings
					variables = false, -- Boolean: Italicizes variables
				},
				overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
				palette_overrides = {},
			})
			vim.cmd.colorscheme("vesper")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",

		opts = {
			open_mapping = "<C-S-`>",
			direction = "float",
			shade_terminals = false,
		},
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {},
		keys = {
			{
				"<leader>qs",
				function()
					require("persistence").load()
				end,
				desc = "Restore Session",
			},
			{
				"<leader>ql",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Restore Last Session",
			},
			{
				"<leader>qd",
				function()
					require("persistence").stop()
				end,
				desc = "Don't Save Current Session",
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<M-l>", -- Alt + L to accept
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			panel = { enabled = false },
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = false,
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat" },
		},
	},
}

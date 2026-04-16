return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({})

			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
			map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
			map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
			map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
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
}

return {
	{
		"williamboman/mason.nvim",
		init = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls" },
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = false,
			},
		},
	},
}

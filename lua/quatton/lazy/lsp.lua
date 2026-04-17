local lsp_configs = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
					disable = { "spell-check" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	ts_ls = {},
	biome = {},
}

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
			ensure_installed = { "lua_ls", "ts_ls" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			for server, config in pairs(lsp_configs) do
				vim.lsp.config(server, config)
			end
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"biome",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
			},
			formatters = {
				biome = {
					prepend_args = function(_, ctx)
						local file = vim.fs.find({ "biome.json" }, {
							path = vim.api.nvim_buf_get_name(0),
							upward = true,
						})[1]
						local args = {
							"check",
							"--formatter-enabled=true",
							"--write",
						}
						if file then
							table.insert(args, "--config-path")
							table.insert(args, file) -- append only if config file found
						end
						return args
					end,
				},
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = false,
			},
		},
	},
}

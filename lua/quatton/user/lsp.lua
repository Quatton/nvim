local lsp_configs = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
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
}

for server, opts in pairs(lsp_configs) do
	vim.lsp.config(server, opts)
end

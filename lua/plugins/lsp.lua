return {
  {
    "neovim/nvim-lspconfig",
    opt = {
      server = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                disable = { "spell-check" },
              },
            },
          },
        },
        codebook = {
          filetypes = {},
        },
      },
    },
  },
}

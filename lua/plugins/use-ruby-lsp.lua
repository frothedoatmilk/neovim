return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        solargraph = {
          autostart = false,
          mason = false
        },
        rubocop = {
          autostart = false,
          mason = false
        },
        ruby_lsp = {},
      },
    },
  },
}

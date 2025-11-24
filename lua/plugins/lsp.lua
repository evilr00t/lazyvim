return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        mason = false,
        autostart = false,
      },
      basedpyright = {
        mason = false,
        autostart = false,
      },
    },
  },
}

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
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

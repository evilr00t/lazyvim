return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        -- basedpyright: stricter community fork of pyright
        basedpyright = {},
        -- disable upstream pyright to avoid duplicate diagnostics
        pyright = { mason = false, autostart = false },
        ruff = {},
        bashls = {},
      },
    },
  },
}

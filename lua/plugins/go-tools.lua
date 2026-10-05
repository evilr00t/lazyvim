return {
  -- gopher.nvim - Go code generation
  -- LSP, formatting, linting, tests and debugging come from the lang.go extra
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    keys = {
      { "<leader>cj", "<cmd>GoTagAdd json<cr>", desc = "Add JSON tags", ft = "go" },
      { "<leader>cy", "<cmd>GoTagAdd yaml<cr>", desc = "Add YAML tags", ft = "go" },
      { "<leader>cx", "<cmd>GoTagRm<cr>", desc = "Remove tags", ft = "go" },
      { "<leader>ci", "<cmd>GoIfErr<cr>", desc = "Generate if err", ft = "go" },
      { "<leader>cg", "<cmd>GoImpl<cr>", desc = "Generate impl", ft = "go" },
    },
  },
}

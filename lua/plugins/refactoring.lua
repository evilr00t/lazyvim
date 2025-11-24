return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup({})
    vim.keymap.set("v", "<leader>rr", function()
      require("refactoring").select_refactor()
    end, { desc = "Refactor", noremap = true, silent = true })
  end,
  event = "VeryLazy",
}

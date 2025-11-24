return {
  "danymat/neogen",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("neogen").setup({})
  end,
  keys = {
    {
      "<leader>cn",
      function()
        require("neogen").generate()
      end,
      desc = "Generate Doc (Neogen)",
    },
  },
}

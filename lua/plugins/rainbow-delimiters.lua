return {
  "hiphish/rainbow-delimiters.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("rainbow-delimiters.setup").setup({})
  end,
}

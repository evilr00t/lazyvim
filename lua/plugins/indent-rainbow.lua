return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = function(_, opts)
      opts = require("indent-rainbowline").make_opts(opts)
      -- the scope line is drawn by mini.indentscope
      opts.scope = vim.tbl_extend("force", opts.scope or {}, { enabled = false })
      return opts
    end,
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
  },

  -- indent guides come from ibl above
  { "folke/snacks.nvim", opts = { indent = { enabled = false } } },
}

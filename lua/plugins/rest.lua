return {
  -- kulala.nvim - Modern REST client without luarocks dependency
  -- A better alternative to rest.nvim that works without luarocks
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    config = function()
      require("kulala").setup({
        -- Use curl for requests
        default_view = "body",
        default_env = "dev",
        debug = false,
      })
    end,
    keys = {
      { "<leader>rr", "<cmd>lua require('kulala').run()<cr>", desc = "Run REST request" },
      { "<leader>rp", "<cmd>lua require('kulala').run()<cr>", desc = "Run request" },
      { "<leader>rs", "<cmd>lua require('kulala').show_stats()<cr>", desc = "Show stats" },
      { "<leader>rc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as curl" },
      { "<leader>ri", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect" },
    },
  },

  -- nvim-jqx - Interactive jq for JSON
  {
    "gennaro-tedesco/nvim-jqx",
    ft = { "json", "yaml" },
    keys = {
      { "<leader>jq", "<cmd>JqxList<cr>", desc = "jq query", ft = "json" },
      { "<leader>jf", "<cmd>JqxQuery<cr>", desc = "jq filter", ft = "json" },
    },
  },

  -- Filetype detection for .http files
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, { "http", "json" })
    end,
  },
}

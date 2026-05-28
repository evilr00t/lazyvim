return {
  -- Terraform documentation lookup
  {
    "ANGkeith/telescope-terraform-doc.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("terraform_doc")
    end,
    ft = { "terraform", "hcl" },
    keys = {
      { "<leader>Td", "<cmd>Telescope terraform_doc<cr>", desc = "Terraform docs", ft = "terraform" },
      {
        "<leader>TM",
        "<cmd>Telescope terraform_doc modules<cr>",
        desc = "Terraform module docs",
        ft = "terraform",
      },
    },
  },

  -- Enhanced Terraform/Terragrunt LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          filetypes = { "terraform", "hcl", "terraform-vars" },
          settings = {
            ["terraform-ls"] = {
              experimentalFeatures = {
                validateOnSave = true,
                prefillRequiredFields = true,
              },
            },
          },
        },
      },
    },
  },

  -- Terraform formatting via none-ls
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.terraform_fmt,
      })
    end,
  },

  -- Terraform linting via nvim-lint
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        terraform = { "tflint" },
      },
    },
  },

  -- Terraform file detection for terragrunt
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, { "terraform", "hcl" })
    end,
  },
}

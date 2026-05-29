return {
  -- Terraform documentation lookup (opens registry in browser, no telescope dep)
  -- Inline docs still available via LSP hover (K) from terraform-ls
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>Td",
        function()
          local q = vim.fn.expand("<cword>")
          vim.ui.open("https://registry.terraform.io/search/providers?q=" .. q)
        end,
        desc = "Terraform provider docs (registry)",
        ft = "terraform",
      },
      {
        "<leader>TM",
        function()
          local q = vim.fn.expand("<cword>")
          vim.ui.open("https://registry.terraform.io/search/modules?q=" .. q)
        end,
        desc = "Terraform module docs (registry)",
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

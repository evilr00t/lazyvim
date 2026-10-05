return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- Python
        "ruff",
        "basedpyright",

        -- Go
        "gopls",
        "golangci-lint",
        "gofumpt",
        "goimports",
        "gomodifytags",
        "impl",
        "iferr",
        "delve", -- Go debugger

        -- Terraform/Terragrunt
        "terraform-ls",
        "tflint",

        -- Kubernetes/YAML
        "helm-ls",
        "yaml-language-server",
        "yamllint",

        -- Shell/Bash
        "bash-language-server",
        "shfmt",
        "shellcheck",

        -- Docker
        "dockerfile-language-server",
        "hadolint",

        -- General tools
        "jq",
        "actionlint", -- GitHub Actions linter

        -- Lua (for neovim config)
        "stylua",
        "lua-language-server",
      })
    end,
  },
}

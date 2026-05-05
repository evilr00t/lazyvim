return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- Python
        "ruff",
        "basedpyright",
        "mypy",
        
        -- Go
        "gopls",
        "golangci-lint",
        "gofumpt",
        "goimports",
        "gomodifytags",
        "impl",
        "delve", -- Go debugger
        
        -- Terraform/Terragrunt
        "terraform-ls",
        "tflint",
        "tfsec",
        
        -- Kubernetes/YAML
        "helm-ls",
        "yaml-language-server",
        "yamllint",
        "yamlfmt",
        
        -- Shell/Bash
        "bash-language-server",
        "shfmt",
        "shellcheck",
        
        -- Docker
        "dockerfile-language-server",
        "hadolint",
        
        -- General tools
        "jq",
        "gitui",
        "actionlint", -- GitHub Actions linter
        "markdownlint",
        
        -- Lua (for neovim config)
        "stylua",
        "lua-language-server",
      })
    end,
    keys = {
      {
        "<leader>gG",
        function()
          Snacks.terminal({ "gitui" })
        end,
        desc = "GitUi (cwd)",
      },
      {
        "<leader>gg",
        function()
          Snacks.terminal({ "gitui" }, { cwd = LazyVim.root.get() })
        end,
        desc = "GitUi (Root Dir)",
      },
    },
    init = function()
      -- delete lazygit keymap for file history
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimKeymaps",
        once = true,
        callback = function()
          pcall(vim.keymap.del, "n", "<leader>gf")
          pcall(vim.keymap.del, "n", "<leader>gl")
        end,
      })
    end,
  },
}

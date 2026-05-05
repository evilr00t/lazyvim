return {
  -- Kubernetes YAML support via yaml-language-server
  -- Just syntax highlighting and LSP validation, no kubectl commands
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        helm_ls = {
          settings = {
            ["helm-ls"] = {
              yamlls = {
                enabled = true,
                diagnosticsLimit = 50,
                showDiagnosticsDirectly = true,
                path = "yaml-language-server",
              },
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                kubernetes = "*.yaml",
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
              },
              schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
              },
              validate = true,
              completion = true,
              hover = true,
            },
          },
        },
      },
    },
  },
}

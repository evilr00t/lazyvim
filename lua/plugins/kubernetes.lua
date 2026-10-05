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
              -- everything else (GitHub workflows, compose, Chart.yaml, kustomization,
              -- Prometheus, ...) comes from SchemaStore.nvim via the lang.yaml extra
              schemas = {
                kubernetes = { "k8s/**/*.yaml", "kubernetes/**/*.yaml" },
              },
            },
          },
        },
      },
    },
  },
}

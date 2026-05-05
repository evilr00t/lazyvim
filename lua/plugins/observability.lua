return {
  -- Log file syntax highlighting
  {
    "mtdl9/vim-log-highlighting",
    ft = "log",
  },

  -- CSV file viewing (for metrics exports)
  {
    "chrisbra/csv.vim",
    ft = "csv",
  },

  -- Prometheus/Grafana query snippets
  {
    "L3MON4D3/LuaSnip",
    optional = true,
    opts = function(_, opts)
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      -- Prometheus snippets
      ls.add_snippets("promql", {
        s("rate", {
          t("rate("),
          i(1, "metric_name"),
          t("["),
          i(2, "5m"),
          t("])"),
        }),
        s("sum", {
          t("sum("),
          i(1, "metric"),
          t(") by ("),
          i(2, "label"),
          t(")"),
        }),
        s("avg", {
          t("avg("),
          i(1, "metric"),
          t(") by ("),
          i(2, "label"),
          t(")"),
        }),
        s("histogram", {
          t("histogram_quantile("),
          i(1, "0.99"),
          t(", sum(rate("),
          i(2, "metric_bucket"),
          t("["),
          i(3, "5m"),
          t("])) by (le))"),
        }),
      })

      -- Add PromQL to YAML files (for Prometheus rules)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "yaml",
        callback = function()
          -- Check if file is Prometheus rules
          local filename = vim.fn.expand("%:t")
          if filename:match("rules") or filename:match("alerts") then
            vim.bo.commentstring = "# %s"
          end
        end,
      })
    end,
  },

  -- Filetype detection for Prometheus and Grafana configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure YAML parser is installed for Prometheus configs
      vim.list_extend(opts.ensure_installed or {}, { "yaml", "json" })

      -- Auto-detect Prometheus rule files
      vim.filetype.add({
        pattern = {
          [".*%.rules%.ya?ml"] = "yaml.prometheus",
          [".*alerts%.ya?ml"] = "yaml.prometheus",
          [".*prometheus%.ya?ml"] = "yaml.prometheus",
        },
      })
    end,
  },

  -- Enhanced YAML validation for Prometheus configs
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Enhance yamlls for Prometheus configs
      if opts.servers and opts.servers.yamlls then
        opts.servers.yamlls.settings = opts.servers.yamlls.settings or {}
        opts.servers.yamlls.settings.yaml = opts.servers.yamlls.settings.yaml or {}
        opts.servers.yamlls.settings.yaml.schemas = opts.servers.yamlls.settings.yaml.schemas or {}

        -- Add Prometheus schema
        opts.servers.yamlls.settings.yaml.schemas["https://json.schemastore.org/prometheus"] =
          "*prometheus*.{yml,yaml}"
        opts.servers.yamlls.settings.yaml.schemas["https://json.schemastore.org/prometheus"] = "*rules*.{yml,yaml}"
        opts.servers.yamlls.settings.yaml.schemas["https://json.schemastore.org/prometheus"] = "*alerts*.{yml,yaml}"
      end
    end,
  },
}

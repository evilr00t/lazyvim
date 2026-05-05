return {
  -- Enhanced docker-compose support
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Ensure docker-compose LSP is configured
      opts.servers = opts.servers or {}
      opts.servers.docker_compose_language_service = {
        filetypes = { "yaml.docker-compose" },
        root_dir = require("lspconfig").util.root_pattern("docker-compose.yml", "docker-compose.yaml"),
      }
    end,
  },

  -- Filetype detection for docker-compose
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.filetype.add({
        pattern = {
          ["docker%-compose%.ya?ml"] = "yaml.docker-compose",
          ["compose%.ya?ml"] = "yaml.docker-compose",
        },
      })
    end,
  },

  -- Docker-compose snippets
  {
    "L3MON4D3/LuaSnip",
    optional = true,
    opts = function(_, opts)
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local fmt = require("luasnip.extras.fmt").fmt

      ls.add_snippets("yaml", {
        -- Docker-compose service template
        s(
          "dcservice",
          fmt(
            [[
{}:
  image: {}
  container_name: {}
  ports:
    - "{}:{}"
  environment:
    - {}={}
  volumes:
    - ./{}:{}
  networks:
    - {}
  restart: unless-stopped
]],
            {
              i(1, "service_name"),
              i(2, "image:tag"),
              i(3, "container_name"),
              i(4, "8080"),
              i(5, "8080"),
              i(6, "ENV_VAR"),
              i(7, "value"),
              i(8, "local_path"),
              i(9, "/container/path"),
              i(10, "default"),
            }
          )
        ),

        -- Docker-compose full template
        s(
          "dcfull",
          fmt(
            [[
version: '{}'

services:
  {}:
    image: {}
    container_name: {}
    ports:
      - "{}:{}"
    environment:
      - {}
    volumes:
      - {}
    networks:
      - {}
    restart: unless-stopped

networks:
  {}:
    driver: bridge

volumes:
  {}:
    driver: local
]],
            {
              i(1, "3.8"),
              i(2, "app"),
              i(3, "nginx:latest"),
              i(4, "my_app"),
              i(5, "80"),
              i(6, "80"),
              i(7, "ENV=production"),
              i(8, "./data:/data"),
              i(9, "app_network"),
              i(10, "app_network"),
              i(11, "app_data"),
            }
          )
        ),

        -- Healthcheck
        s(
          "dchealthcheck",
          fmt(
            [[
healthcheck:
  test: ["CMD", "{}"]
  interval: {}
  timeout: {}
  retries: {}
  start_period: {}
]],
            {
              i(1, "curl -f http://localhost/health || exit 1"),
              i(2, "30s"),
              i(3, "10s"),
              i(4, "3"),
              i(5, "40s"),
            }
          )
        ),

        -- Depends on
        s(
          "dcdepends",
          fmt(
            [[
depends_on:
  {}:
    condition: {}
]],
            {
              i(1, "db"),
              i(2, "service_healthy"),
            }
          )
        ),
      })
    end,
  },

  -- Enhanced YAML validation for docker-compose
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      if opts.servers and opts.servers.yamlls then
        opts.servers.yamlls.settings = opts.servers.yamlls.settings or {}
        opts.servers.yamlls.settings.yaml = opts.servers.yamlls.settings.yaml or {}
        opts.servers.yamlls.settings.yaml.schemas = opts.servers.yamlls.settings.yaml.schemas or {}

        -- Add docker-compose schema
        opts.servers.yamlls.settings.yaml.schemas["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
          "docker-compose*.{yml,yaml}"
        opts.servers.yamlls.settings.yaml.schemas["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
          "compose.{yml,yaml}"
      end
    end,
  },
}

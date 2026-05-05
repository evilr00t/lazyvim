return {
  -- go.nvim - Advanced Go tooling
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        -- disable lsp_cfg to avoid conflicts with LazyVim's LSP setup
        lsp_cfg = false,
        lsp_gofumpt = true,
        lsp_on_attach = false, -- LazyVim handles this
        lsp_codelens = true,
        lsp_inlay_hints = {
          enable = false, -- You disabled these globally
        },
        diagnostic = {
          hdlr = false, -- LazyVim handles diagnostics
        },
        dap_debug = true,
        dap_debug_gui = true,
        trouble = true,
        luasnip = true,
        test_runner = "go", -- use standard go test
        run_in_floaterm = true,
      })

      -- Auto format on save
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimport()
        end,
        group = format_sync_grp,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
    keys = {
      { "<leader>cR", "<cmd>GoRun<cr>", desc = "Go Run", ft = "go" },
      { "<leader>ct", "<cmd>GoTest<cr>", desc = "Go Test File", ft = "go" },
      { "<leader>cT", "<cmd>GoTestFunc<cr>", desc = "Go Test Function", ft = "go" },
      { "<leader>cC", "<cmd>GoCoverage<cr>", desc = "Go Coverage", ft = "go" },
      { "<leader>ca", "<cmd>GoAlt<cr>", desc = "Go Alternate (test/impl)", ft = "go" },
      { "<leader>cF", "<cmd>GoFillStruct<cr>", desc = "Go Fill Struct", ft = "go" },
      { "<leader>cI", "<cmd>GoIfErr<cr>", desc = "Go If Err", ft = "go" },
    },
  },

  -- gopher.nvim - Go code generation
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("gopher").setup({
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "gotests",
          impl = "impl",
          iferr = "iferr",
        },
      })
    end,
    keys = {
      { "<leader>cj", "<cmd>GoTagAdd json<cr>", desc = "Add JSON tags", ft = "go" },
      { "<leader>cy", "<cmd>GoTagAdd yaml<cr>", desc = "Add YAML tags", ft = "go" },
      { "<leader>cx", "<cmd>GoTagRm<cr>", desc = "Remove tags", ft = "go" },
      { "<leader>ci", "<cmd>GoIfErr<cr>", desc = "Generate if err", ft = "go" },
      { "<leader>cg", "<cmd>GoImpl<cr>", desc = "Generate impl", ft = "go" },
    },
  },

  -- Enhanced Go LSP settings
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = false,
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = false,
                functionTypeParameters = false,
                parameterNames = false,
                rangeVariableTypes = false,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
      },
    },
  },
}

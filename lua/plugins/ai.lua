return {
  -- OpenAI inline completions (ghost text), accepted with <Tab>
  -- Needs OPENAI_API_KEY in the environment; requests are billed to that OpenAI API account
  {
    "milanglacier/minuet-ai.nvim",
    event = "InsertEnter",
    cmd = "Minuet",
    opts = {
      provider = "openai",
      provider_options = {
        openai = {
          model = "gpt-5.6-luna",
          optional = {
            max_completion_tokens = 128,
            reasoning_effort = "none",
          },
        },
      },
      -- raise these to cut cost / avoid rate limits
      throttle = 1000,
      debounce = 400,
      -- never send secrets to the API
      enable_predicates = {
        function()
          local name = vim.fn.expand("%:t")
          return vim.bo.filetype ~= "env"
            and not name:match("^%.env")
            and not name:match("%.pem$")
            and not name:match("%.key$")
            and not name:match("%.tfvars$")
        end,
      },
      virtualtext = {
        auto_trigger_ft = { "*" },
        auto_trigger_ignore_ft = { "snacks_picker_input", "snacks_input" },
        keymap = {
          accept_line = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    },
  },

  -- <Tab> accepts via LazyVim's ai_accept (after snippet jumps, before a literal tab)
  {
    "milanglacier/minuet-ai.nvim",
    opts = function()
      LazyVim.cmp.actions.ai_accept = function()
        local vt = require("minuet.virtualtext").action
        if vt.is_visible() then
          LazyVim.create_undo()
          vt.accept()
          return true
        end
      end
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, { require("minuet.lualine"), display_name = "model" })
    end,
  },

  -- keep sidekick's AI CLI terminal (Codex, Claude, ...) but drop Copilot next-edit suggestions
  { "folke/sidekick.nvim", opts = { nes = { enabled = false } } },
}

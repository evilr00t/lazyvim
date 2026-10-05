return {
  -- Windsurf (Codeium) inline completions as ghost text, accepted with <Tab>
  -- First run: :NeoCodeium auth
  {
    "monkoose/neocodeium",
    event = "InsertEnter",
    cmd = "NeoCodeium",
    opts = function()
      -- <Tab> accepts via LazyVim's ai_accept (after snippet jumps, before a literal tab)
      LazyVim.cmp.actions.ai_accept = function()
        local neocodeium = require("neocodeium")
        if neocodeium.visible() then
          LazyVim.create_undo()
          neocodeium.accept()
          return true
        end
      end

      -- hide suggestions while blink's menu is open
      vim.api.nvim_create_autocmd("User", {
        pattern = "BlinkCmpMenuOpen",
        callback = function()
          require("neocodeium").clear()
        end,
      })

      return {
        filetypes = { snacks_picker_input = false, snacks_input = false },
        filter = function(bufnr)
          -- never send secrets
          local name = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
          if
            vim.bo[bufnr].filetype == "env"
            or name:match("^%.env")
            or name:match("%.pem$")
            or name:match("%.key$")
            or name:match("%.tfvars$")
          then
            return false
          end
          return not require("blink.cmp").is_visible()
        end,
      }
    end,
    keys = {
      {
        "<M-]>",
        function()
          require("neocodeium").cycle_or_complete()
        end,
        mode = "i",
        desc = "Next suggestion",
      },
      {
        "<M-[>",
        function()
          require("neocodeium").cycle_or_complete(-1)
        end,
        mode = "i",
        desc = "Previous suggestion",
      },
      {
        "<M-l>",
        function()
          require("neocodeium").accept_line()
        end,
        mode = "i",
        desc = "Accept suggestion line",
      },
      {
        "<C-]>",
        function()
          require("neocodeium").clear()
        end,
        mode = "i",
        desc = "Dismiss suggestion",
      },
    },
  },

  -- Codex CLI (signs in with your ChatGPT plan) as the default Sidekick tool;
  -- Copilot next-edit suggestions stay off
  {
    "folke/sidekick.nvim",
    opts = { nes = { enabled = false } },
    keys = {
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle({ name = "codex" })
        end,
        desc = "Sidekick Toggle Codex",
      },
    },
  },
}

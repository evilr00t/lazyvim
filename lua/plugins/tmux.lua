return {
  -- Auto-rename tmux window based on file
  {
    "LazyVim/LazyVim",
    opts = function()
      if not vim.env.TMUX then
        return
      end

      vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
        callback = function()
          vim.fn.system("tmux rename-window " .. vim.fn.expand("%:t"))
        end,
      })

      vim.api.nvim_create_autocmd("VimLeave", {
        callback = function()
          vim.fn.system("tmux rename-window zsh")
        end,
      })
    end,
  },

  -- Seamless navigation between tmux and nvim panes
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate left (tmux-aware)" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate down (tmux-aware)" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate up (tmux-aware)" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate right (tmux-aware)" },
    },
  },
}

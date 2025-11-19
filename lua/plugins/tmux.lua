return {
  {
    "LazyVim/LazyVim",
    opts = function()
      if vim.env.TMUX then
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
      end
    end,
  },
}

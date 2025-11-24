return {
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
}

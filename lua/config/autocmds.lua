-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

if vim.env.TMUX then
  vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
    callback = function()
      if vim.bo.buftype ~= "" then
        return
      end
      vim.fn.system("tmux rename-window " .. vim.fn.shellescape(vim.fn.expand("%:t")))
    end,
  })

  vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
      vim.fn.system("tmux rename-window zsh")
    end,
  })
end

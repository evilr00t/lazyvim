-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

if vim.env.TMUX then
  vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
    callback = function()
      if vim.bo.buftype ~= "" then
        return
      end
      vim.system({ "tmux", "rename-window", vim.fn.expand("%:t") })
    end,
  })

  -- rename-window turns off automatic-rename; hand the name back to tmux on exit
  vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
      vim.system({ "tmux", "set-window-option", "automatic-rename", "on" }):wait()
    end,
  })
end

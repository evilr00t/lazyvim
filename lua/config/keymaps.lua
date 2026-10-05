-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- ========================================
-- YAML/JSON Validation: <leader>c prefix
-- ========================================
-- These are set via autocmd for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    map("n", "<leader>cy", "<cmd>!yamllint %<cr>", { desc = "Lint YAML", buffer = true })
    map("n", "<leader>cP", "<cmd>!promtool check rules %<cr>", { desc = "Prometheus: check rules", buffer = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    map("n", "<leader>cJ", "<cmd>!jq . %<cr>", { desc = "Format JSON with jq", buffer = true })
  end,
})

-- ========================================
-- QUICK NAVIGATION HELPERS
-- ========================================
if Snacks then
  map("n", "<leader>fd", function()
    Snacks.picker.files({ cwd = vim.fn.expand("~/dev") })
  end, { desc = "Find files in ~/dev" })
  map("n", "<leader>fD", function()
    Snacks.picker.files({ cwd = vim.fn.expand("~/dev"), hidden = true })
  end, { desc = "Find all files in ~/dev" })
end

-- ========================================
-- LOG FILE HELPERS
-- ========================================
-- line wrap toggle is LazyVim's <leader>uw
map("n", "<leader>cL", "<cmd>set filetype=log<cr>", { desc = "Set filetype to log" })

-- ========================================
-- QUICK COMMANDS
-- ========================================
map("n", "<leader>X", "<cmd>!chmod +x %<cr>", { desc = "Make file executable" })
map("n", "<leader>Y", '<cmd>let @+ = expand("%:p")<cr>', { desc = "Yank absolute path" })
map("n", "<leader>yr", '<cmd>let @+ = expand("%")<cr>', { desc = "Yank relative path" })

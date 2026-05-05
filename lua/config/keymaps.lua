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
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    map("n", "<leader>cJ", "<cmd>!jq . %<cr>", { desc = "Format JSON with jq", buffer = true })
  end,
})

-- ========================================
-- TESTING: <leader>tt prefix
-- ========================================
-- Python test keybindings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    map("n", "<leader>ttp", "<cmd>!pytest %<cr>", { desc = "Pytest: current file", buffer = true })
    map("n", "<leader>tta", "<cmd>!pytest<cr>", { desc = "Pytest: all", buffer = true })
    map("n", "<leader>ttv", "<cmd>!pytest -v %<cr>", { desc = "Pytest: verbose", buffer = true })
    map("n", "<leader>ttx", "<cmd>!pytest -x %<cr>", { desc = "Pytest: stop on first fail", buffer = true })
  end,
})

-- ========================================
-- PROMETHEUS/GRAFANA HELPERS
-- ========================================
map("n", "<leader>pm", "<cmd>!promtool check metrics<cr>", { desc = "Prometheus: check metrics" })
map("n", "<leader>pr", "<cmd>!promtool check rules %<cr>", { desc = "Prometheus: check rules" })

-- ========================================
-- QUICK NAVIGATION HELPERS
-- ========================================
map("n", "<leader>fd", "<cmd>Telescope find_files cwd=~/dev<cr>", { desc = "Find files in ~/dev" })
map("n", "<leader>fD", "<cmd>Telescope find_files cwd=~/dev hidden=true<cr>", { desc = "Find all files in ~/dev" })

-- ========================================
-- LOG FILE HELPERS
-- ========================================
map("n", "<leader>lf", "<cmd>set filetype=log<cr>", { desc = "Set filetype to log" })
map("n", "<leader>lw", "<cmd>set wrap!<cr>", { desc = "Toggle line wrap" })

-- ========================================
-- QUICK COMMANDS
-- ========================================
map("n", "<leader>X", "<cmd>!chmod +x %<cr>", { desc = "Make file executable" })
map("n", "<leader>Y", '<cmd>let @+ = expand("%:p")<cr>', { desc = "Yank absolute path" })
map("n", "<leader>yr", '<cmd>let @+ = expand("%")<cr>', { desc = "Yank relative path" })
